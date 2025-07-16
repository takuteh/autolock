#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>
#include <string>
#include <autolock_setting.h>
#include <limits>

using json = nlohmann::json;
using namespace std;

autolock_setting::autolock_setting(std::string setting_file)
{
    this->setting_file = setting_file;
    // デフォルト値を設定
    this->autolock = true;
    this->ignore_clsw = true;
    this->rotate_direction = "left";
    this->broker_address = "localhost";
    this->boot_topic = "/autolock/boot";
    this->open_topic = "/door/open";
    this->close_topic = "/door/close";
    this->relay_on_topic = "/door/relay_on";
    this->relay_off_topic = "/door/relay_off";
    this->change_conf_topic = "/autolock/change_conf";
    this->open_message = "1";
    this->close_message = "1";
    this->relay_on_message = "1";
    this->relay_off_message = "1";
    this->line_channel_token = "";
    this->slack_channel_token = "";
    this->slack_send_channel = "#general";
    this->mqtt_port = 1883;
    this->timeout_seq = "no";
    this->authorize_external_users = true;
    this->authorize_internal_users = false;
    // 設定読み込み
    this->load_setting();
}

std::string autolock_setting::load_setting()
{

    float data = 0;

    std::ifstream ifs(this->setting_file);
    std::string jsonstr = "";
    std::string buf = "";
    if (ifs.fail())
    {
        std::cerr << "File Open Error" << std::endl;
        return jsonstr;
    }

    while (!ifs.eof())
    {
        getline(ifs, buf);
        jsonstr += buf;
    }

    // JSON文字列をパース:
    auto jobj = json::parse(jsonstr);

    // mosquittoで使うものは[const char*]のため、一旦string型の変数に格納
    this->Broker_address = jobj["mqtt"]["broker_address"];
    this->Boot_topic = jobj["mqtt"]["publish"]["boot"]["topic"];
    this->Open_topic = jobj["mqtt"]["subscribe"]["open"]["topic"];
    this->Close_topic = jobj["mqtt"]["subscribe"]["close"]["topic"];
    this->Relay_on_topic = jobj["mqtt"]["subscribe"]["relay_on"]["topic"];
    this->Relay_off_topic = jobj["mqtt"]["subscribe"]["relay_off"]["topic"];
    this->Change_conf_topic = jobj["mqtt"]["subscribe"]["change_config"]["topic"];

    // const char*に変換
    this->broker_address = this->Broker_address.c_str();
    this->boot_topic = this->Boot_topic.c_str();
    this->open_topic = this->Open_topic.c_str();
    this->close_topic = this->Close_topic.c_str();
    this->relay_on_topic = this->Relay_on_topic.c_str();
    this->relay_off_topic = this->Relay_off_topic.c_str();
    this->change_conf_topic = this->Change_conf_topic.c_str();

    this->autolock = jobj["main"]["autolock"];
    this->ignore_clsw = jobj["main"]["ignore_clsw"];
    this->rotate_direction = jobj["main"]["rotate_direction"];
    this->timeout_seq = jobj["main"]["timeout_seq"];
    this->authorize_external_users = jobj["main"]["authorize_external_users"];
    this->authorize_internal_users = jobj["main"]["authorize_internal_users"];
    this->open_message = jobj["mqtt"]["subscribe"]["open"]["message"];
    this->close_message = jobj["mqtt"]["subscribe"]["close"]["message"];
    this->relay_on_message = jobj["mqtt"]["subscribe"]["relay_on"]["message"];
    this->relay_off_message = jobj["mqtt"]["subscribe"]["relay_off"]["message"];
    this->mqtt_port = jobj["mqtt"]["mqtt_port"];
    this->line_channel_token = jobj["line"]["channel_token"];
    this->slack_channel_token = jobj["slack"]["channel_token"];
    this->slack_send_channel = jobj["slack"]["send_channel"];
    this->line_user_ids = jobj["line"]["user_ids"].get<std::vector<std::string>>();
    return jsonstr;
}
