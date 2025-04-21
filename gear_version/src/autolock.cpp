#include <pigpiod_if2.h>
#include <unistd.h>
#include <iostream>
#include <chrono>
#include <string.h>
#include <thread>
#include <ctime>
#include <nlohmann/json.hpp>
#include <limits>
// 独自ライブラリ
#include <control_servo.h>
#include <min_mqtt.h>
#include <autolock_setting.h>
#include <line_api.h>
#include <slack_api.h>

#define OP_SW 9
#define CL_SW 2
#define RE_SW 3
#define RELAY 22

#define DEBOUNCE_TIME_US 1.5

bool cl_flag = false; // 施錠フラグ
std::string setting_file = SETTING_FILE;
int timeout_seq;
int pi = pigpio_start(nullptr, nullptr);

autolock_setting au_set(setting_file);
CONTROL_SERVO autolock(pi, &au_set);

Mqtt mqtt;
line_api line(au_set.line_channel_token);
slack_api slack(au_set.slack_channel_token);

std::time_t last_rsw_exe_time = 0;     // リードスイッチ、最終処理実行時刻
std::time_t current_rsw_call_time = 0; // リードスイッチ、コールバック呼び出し時刻

void open_sw(int pi, unsigned gpio, unsigned level, uint32_t tick)
{
    if (!autolock.open_switch(level, DEBOUNCE_TIME_US))
    {
        cl_flag = true;
        std::thread([]
                    { 
            //line.send_line_message(au_set.line_user_ids,"ボタンで解錠しました");
            slack.send_slack_message(au_set.slack_send_channel, "ボタンで解錠しました"); })
            .detach();
    }
}

void close_sw(int pi, unsigned gpio, unsigned level, uint32_t tick)
{
    if (!autolock.close_switch(level, DEBOUNCE_TIME_US))
    {
        cl_flag = false;
        std::thread([]
                    { 
            //line.send_line_message(au_set.line_user_ids,"ボタンで施錠しました");
            slack.send_slack_message(au_set.slack_send_channel, "ボタンで施錠しました"); })
            .detach();
    }
}

void read_sw(int pi, unsigned gpio, unsigned level, uint32_t tick)
{
    current_rsw_call_time = time_time(); // 現在時刻の更新
    // 直前のボタンの押下から一定時間が経過していない場合は無視する
    if (current_rsw_call_time - last_rsw_exe_time < DEBOUNCE_TIME_US)
    {
        return;
    }
    if (level == 0)
    {
        std::thread([]
                    {
            //line.send_line_message(au_set.line_user_ids,"ドアが閉まりました");
            slack.send_slack_message(au_set.slack_send_channel, "ドアが閉まりました"); })
            .detach();
        // オートロックが無効なら施錠しない
        if (au_set.autolock == "disable")
        {
            return;
        }
        else if (!autolock.read_switch(level, DEBOUNCE_TIME_US))
        {
            cl_flag = false;
            std::thread([]
                        {
                //line.send_line_message(au_set.line_user_ids,"施錠しました");
                slack.send_slack_message(au_set.slack_send_channel, "施錠しました"); })
                .detach();
            last_rsw_exe_time = time_time(); // 最終処理時刻の更新
        }
    }
    else if (level == 1)
    {
        std::thread([]
                    { 
            //line.send_line_message(au_set.line_user_ids,"ドアが開きました");
            slack.send_slack_message(au_set.slack_send_channel, "ドアが開きました"); })
            .detach();
        last_rsw_exe_time = time_time(); // 最終処理時刻の更新
    }
}

void mqtt_message_received_wrapper(struct mosquitto *mosq, void *userdata, const struct mosquitto_message *message)
{
    std::string topic_str = message->topic;
    std::string payload_str = (char *)message->payload;
    std::cout << topic_str << std::endl;
    nlohmann::json mqtt_mes = nlohmann::json::parse(payload_str);

    // 送信メッセージ定義
    std::string send_str = "";
    std::string app = mqtt_mes.value("app", "MQTT");
    std::string user = mqtt_mes.value("user", "Unknown");
    std::string operate_mes = mqtt_mes.value("message", "null");
    std::string operation = "";

    bool send_flag = false; // 送信フラグ

    if (topic_str == au_set.open_topic && operate_mes == au_set.open_message)
    {
        autolock.open_switch(1, DEBOUNCE_TIME_US);
        cl_flag = true;
        send_flag = true;
        operation = "解錠";
    }

    if (topic_str == au_set.close_topic && operate_mes == au_set.close_message)
    {
        autolock.close_switch(1, DEBOUNCE_TIME_US);
        cl_flag = false;
        send_flag = true;
        operation = "施錠";
    }

    if (topic_str == au_set.relay_topic && operate_mes == au_set.relay_message)
    {
        std::cout << "relay" << std::endl;
        gpio_write(pi, RELAY, 1);
        sleep(1);
        gpio_write(pi, RELAY, 0);
        send_flag = true;
        operation = "モーターリセット";
    }

    if (send_flag)
    {
        send_str = user + "が" + app + "で" + operation + "しました";
        // line.send_line_message(au_set.line_user_ids, send_str);
        slack.send_slack_message(au_set.slack_send_channel, send_str);
        send_flag = false;
    }
}

int main()
{
    //  mqttの設定
    mqtt.mosq = mosquitto_new(NULL, true, NULL);
    mqtt.initialize_mqtt(au_set);

    mosquitto_message_callback_set(mqtt.mosq, mqtt_message_received_wrapper);

    set_mode(pi, OP_SW, PI_INPUT);
    set_mode(pi, CL_SW, PI_INPUT);
    set_mode(pi, RE_SW, PI_INPUT);
    set_mode(pi, RELAY, PI_OUTPUT);

    // 各ボタンをプルダウンに設定
    set_pull_up_down(pi, OP_SW, PI_PUD_UP);
    set_pull_up_down(pi, CL_SW, PI_PUD_UP);
    set_pull_up_down(pi, RE_SW, PI_PUD_UP);
    set_pull_up_down(pi, RELAY, PI_PUD_DOWN);

    // ボタン割り込みのコールバック関数設定
    callback(pi, OP_SW, RISING_EDGE, open_sw);
    callback(pi, CL_SW, RISING_EDGE, close_sw);
    callback(pi, RE_SW, EITHER_EDGE, read_sw);

    mosquitto_loop_start(mqtt.mosq);
    while (1)
    {
        autolock.current_rsw_time = time_time();
        auto elapsed_rsw_time = autolock.current_rsw_time - autolock.start_rsw_time;
        // 鍵が開きっぱなしにならないための処理
        if (au_set.timeout_seq != "no" && au_set.autolock == "enable")
        {
            timeout_seq = stoi(au_set.timeout_seq);
            if (cl_flag == true && elapsed_rsw_time >= timeout_seq)
            {
                // ドアが閉まっているかの確認
                if (gpio_read(pi, RE_SW) == 0)
                {
                    std::cout << "door_closed" << std::endl;
                    autolock.close(19, 6);
                    cl_flag = false;
                    std::thread([]
                                {
                    //line.send_line_message(au_set.line_user_ids, "タイムアウトしたため施錠しました");
                    slack.send_slack_message(au_set.slack_send_channel, "タイムアウトしたため施錠しました"); })
                        .detach();
                }
            }
        }
        sleep(1);
        std::cout << gpio_read(pi, RE_SW) << std::endl;
    }
    mqtt.clean_mqtt();
    return 0;
}
