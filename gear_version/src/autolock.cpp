#include <pigpiod_if2.h>
#include "control_servo.h"
#include <unistd.h>
#include <iostream>
#include <atomic>
#include <chrono>
#include <thread>

#define OP_SW 9
#define CL_SW 17
#define RE_SW 4

#define DEBOUNCE_TIME_US 1.5 

std::atomic<bool> interrupt_executing(false);
int pi = pigpio_start(nullptr, nullptr);
CONTROL_SERVO autolock(pi);

volatile uint32_t last_button_time = 0;

void open_switch(int pi, unsigned gpio, unsigned level, uint32_t tick){
        uint32_t current_time = time_time();
            // 直前のボタンの押下から一定時間が経過していない場合は無視する
    if (current_time - last_button_time < DEBOUNCE_TIME_US) {
        return;
    }
if(level==1){
    std::cout<<"open"<<std::endl;
    autolock.open(19,6);
}
    // 最後のボタン押下時刻を更新
    last_button_time = current_time;
}

void close_and_read_switch(int pi, unsigned gpio, unsigned level, uint32_t tick){
 uint32_t current_time = time_time();
            // 直前のボタンの押下から一定時間が経過していない場合は無視する
    if (current_time - last_button_time < DEBOUNCE_TIME_US) {
        return;
    }
if(level==1){
    std::cout<<"close"<<std::endl;
    autolock.close(19,6);
}
    // 最後のボタン押下時刻を更新
    last_button_time = current_time;
}

int main(){
    
        set_mode(pi, OP_SW, PI_INPUT);
        set_mode(pi, CL_SW, PI_INPUT);
        set_mode(pi, RE_SW, PI_INPUT);

        //各ボタンをプルダウンに設定
        set_pull_up_down(pi, OP_SW, PI_PUD_DOWN);
        set_pull_up_down(pi, CL_SW, PI_PUD_DOWN);
        set_pull_up_down(pi, RE_SW, PI_PUD_DOWN);

        //ボタン割り込みのコールバック関数設定
        callback(pi, OP_SW, RISING_EDGE, open_switch);
        callback(pi, RE_SW, RISING_EDGE, close_and_read_switch);
        callback(pi, CL_SW, RISING_EDGE, close_and_read_switch);


        while(1){
            sleep(1);
            std::cout<<"0"<<std::endl;
        }

    return 0;
}
