#include <pigpiod_if2.h>
#include "control_servo.h"

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
