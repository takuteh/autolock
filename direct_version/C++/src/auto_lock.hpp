#ifndef AUTO_LOCK_HPP
#define AUTO_LOCK_HPP

#include<iostream>
#include<unistd.h>
#include<pigpiod_if2.h>
#include<string>

namespace auto_lock{
class Autolc{
    public:
        void auto_lock(int palse_width);
        Autolc(int &get_pi,int gpio);
        int get_pulse(std::string pulse);
        int motion;

    private:    
        int pi;
        int servo_pin;

        //パルス幅変数
        int open=2500;
        int close=500;
        int stop=0;
};
}//namespace auto_lock

#endif