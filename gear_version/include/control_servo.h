#ifndef CONTROL_SERVO_H
#define CONTROL_SERVO_H
#include <unistd.h>
#include <ctime>
class CONTROL_SERVO{
    public:
    int pi;
    CONTROL_SERVO(int pi);
    ~CONTROL_SERVO();
    void open(int gpio_pin1,int gpio_pin2);
    void close(int gpio_pin1,int gpio_pin2);
    std::time_t start_rsw_time=0;
    std::time_t last_button_time=0;
    std::time_t current_rsw_time=0;
    std::time_t current_time=0;
    std::time_t last_rsw_time=0;
    std::time_t current_rsw_time1=0;
    int open_switch(unsigned level,float debounce_time);
    int close_switch(unsigned level,float debounce_time);
    int read_switch(unsigned level,float debounce_time);

};

#endif