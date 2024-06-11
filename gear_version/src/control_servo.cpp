#include <pigpiod_if2.h>
#include "control_servo.h"
#include <chrono>
#include <iostream>

#define RE_SW 3

CONTROL_SERVO::CONTROL_SERVO(int pi){
    this->pi=pi;
}

CONTROL_SERVO::~CONTROL_SERVO(){
    pigpio_stop(this->pi);
}

void CONTROL_SERVO::open(int gpio_pin1,int gpio_pin2){
set_servo_pulsewidth(this->pi,gpio_pin1,1500);
set_servo_pulsewidth(this->pi,gpio_pin2,1500);
usleep(100000);
 set_servo_pulsewidth(this->pi,gpio_pin1,2500);
 set_servo_pulsewidth(this->pi,gpio_pin2,2500);
usleep(800000);
 set_servo_pulsewidth(this->pi,gpio_pin1,1500);
 set_servo_pulsewidth(this->pi,gpio_pin2,1500);
}

void CONTROL_SERVO::close(int gpio_pin1,int gpio_pin2){
set_servo_pulsewidth(this->pi,gpio_pin1,1500);
set_servo_pulsewidth(this->pi,gpio_pin2,1500);
usleep(100000);
 set_servo_pulsewidth(this->pi,gpio_pin1,500);
 set_servo_pulsewidth(this->pi,gpio_pin2,500);
usleep(800000);
 set_servo_pulsewidth(this->pi,gpio_pin1,1500);
 set_servo_pulsewidth(this->pi,gpio_pin2,1500);
}

void CONTROL_SERVO::open_switch(unsigned level,float debounce_time){
        this->current_time = time_time();
            // 直前のボタンの押下から一定時間が経過していない場合は無視する
    if (this->current_time - this->last_button_time < debounce_time) {
        return;
    }
if(level==1){
    this->start_rsw_time = time_time();
    std::cout<<"open"<<std::endl;
    this->open(19,6);
}
    // 最後のボタン押下時刻を更新
    this->last_button_time = this->current_time;
}

void CONTROL_SERVO::close_switch(unsigned level,float debounce_time){
     this->current_time = time_time();
            // 直前のボタンの押下から一定時間が経過していない場合は無視する
    if (this->current_time - this->last_button_time < debounce_time) {
        return;
    }
if(level==1){
    if(gpio_read(pi,RE_SW)==0){ //リードセンサーに反応がない場合無視する
        return;
    }
    std::cout<<"close"<<std::endl;
    this->close(19,6);
}
    // 最後のボタン押下時刻を更新
    this->last_button_time = this->current_time;
}

void CONTROL_SERVO::read_switch(unsigned level,float debounce_time){
     this->current_time = time_time();
            // 直前のボタンの押下から一定時間が経過していない場合は無視する
    if (this->current_time - this->last_button_time < debounce_time) {
        return;
    }
if(level==0){
    std::cout<<"read_sw"<<std::endl;
    sleep(2); //完全に扉が閉まるまで待機
    this->close(19,6);
}
    // 最後のボタン押下時刻を更新
    this->last_button_time = this->current_time;
}
