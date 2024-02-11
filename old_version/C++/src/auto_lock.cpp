// #include<iostream>
// #include<unistd.h>
// #include<pigpiod_if2.h>

#include"./auto_lock.hpp"

using std::cout;
using std::endl;

namespace auto_lock{
Autolc::Autolc(int &get_pi,int gpio){
    //初期化
    this->pi=get_pi;
    this->servo_pin=gpio;
    set_mode(this->pi,servo_pin,PI_OUTPUT);
}

void Autolc::auto_lock(int pulse_width){
set_servo_pulsewidth(this->pi,this->servo_pin,pulse_width);
}

int Autolc::get_pulse(std::string pulse){
    if(pulse=="open"){
            motion=this->open;
    }else if(pulse=="close"){
            motion=this->close;
    }else if(pulse=="stop"){
            motion=this->stop;
    }
    return motion;
}
}//namespace auto_lock
