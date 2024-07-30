#include"./auto_lock.hpp"
#include"./switch.hpp"

namespace auto_lock{
Switch::Switch(int &get_pi,int btn_gpio,int rsw_gpio){
    this->pi=get_pi;
    this->btn_pin=btn_gpio;
    this->rsw_pin=rsw_gpio;

    set_mode(this->pi,btn_pin,PI_INPUT);
    set_mode(this->pi,rsw_pin,PI_INPUT);
}

bool Switch::read_btn(){return gpio_read(this->pi,btn_pin);}

bool Switch::read_rsw(){return gpio_read(this->pi,rsw_pin);}
}//namespace auto_lock
