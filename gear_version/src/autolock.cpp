#include <pigpiod_if2.h>
#include "control_servo.h"
#include <unistd.h>
#include <iostream>
#include <chrono>
#include "min_mqtt.h"

#define OP_SW 9
#define CL_SW 2
#define RE_SW 3

#define DEBOUNCE_TIME_US 1.5 
#define TIMER_INTERVAL 300

int pi = pigpio_start(nullptr, nullptr);
CONTROL_SERVO autolock(pi);
Mqtt mqtt;

volatile uint32_t last_button_time = 0;

void open_sw(int pi, unsigned gpio, unsigned level, uint32_t tick){
    autolock.open_switch(level,DEBOUNCE_TIME_US);
}

void close_sw(int pi, unsigned gpio, unsigned level, uint32_t tick){
   autolock.close_switch(level,DEBOUNCE_TIME_US);
}

void read_sw(int pi, unsigned gpio, unsigned level, uint32_t tick){
   autolock.read_switch(level,DEBOUNCE_TIME_US);
}

void mqtt_message_received_wrapper(struct mosquitto *mosq, void *userdata, const struct mosquitto_message *message) {
    std::string topic_str=message->topic;
    std::string payload_str=(char *)message->payload;
if(topic_str==mqtt.open_topic && payload_str=="1"){
 autolock.open_switch(1,DEBOUNCE_TIME_US);
}

if(topic_str==mqtt.close_topic && payload_str=="1"){
 autolock.close_switch(1,DEBOUNCE_TIME_US);
}
}

int main(){
    //mqttの設定
         mqtt.mosq=mosquitto_new(NULL, true, NULL);
         mqtt.set_param();

         mqtt.initialize_mqtt();
         mosquitto_message_callback_set(mqtt.mosq, mqtt_message_received_wrapper);
         //mosquitto_loop_forever(mqtt.mosq, -1, 1);
         

        set_mode(pi, OP_SW, PI_INPUT);
        set_mode(pi, CL_SW, PI_INPUT);
        set_mode(pi, RE_SW, PI_INPUT);

        //各ボタンをプルダウンに設定
        set_pull_up_down(pi, OP_SW, PI_PUD_UP);
        set_pull_up_down(pi, CL_SW, PI_PUD_UP);
        set_pull_up_down(pi, RE_SW, PI_PUD_UP);

        //ボタン割り込みのコールバック関数設定
        callback(pi, OP_SW, RISING_EDGE, open_sw);
        callback(pi, CL_SW, RISING_EDGE, close_sw);
        callback(pi, RE_SW, EITHER_EDGE, read_sw);
    mosquitto_loop_start(mqtt.mosq);
        while(1){
            autolock.current_rsw_time=time_time();
            auto elapsed_rsw_time=autolock.current_rsw_time-autolock.start_rsw_time;
            if(elapsed_rsw_time>=TIMER_INTERVAL&&elapsed_rsw_time<=TIMER_INTERVAL+0.5){
              if(gpio_read(pi,RE_SW)==0){
               std::cout<<"door_closed"<<std::endl; 
               autolock.close(19,6);
             }
            }
            sleep(1);
            std::cout<<"0"<<std::endl;
        }
mqtt.clean_mqtt();
    return 0;
}