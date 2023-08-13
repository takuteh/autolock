#ifndef SWITCH_HPP
#define SWITCH_HPP

namespace auto_lock{
class Switch{
    public:
        Switch(int &get_pi,int btn_gpio,int rsw_gpio);
        bool read_btn();
        bool read_rsw();
    private:
        int pi;
        int btn_pin;
        int rsw_pin;
};
}//namespace auto_lock

#endif