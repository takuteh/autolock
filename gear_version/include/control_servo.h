#ifndef CONTROL_SERVO_H
#define CONTROL_SERVO_H
#include <unistd.h>
#include <ctime>
#include <string>
#include <autolock_setting.h>

class CONTROL_SERVO
{
public:
    int pi;
    CONTROL_SERVO(int pi, autolock_setting *au_set);
    ~CONTROL_SERVO();
    void open(int gpio_pin1, int gpio_pin2);
    void close(int gpio_pin1, int gpio_pin2);
    std::time_t start_rsw_time = 0;
    std::time_t last_button_time = 0;
    std::time_t current_rsw_time = 0;
    std::time_t current_time = 0;
    std::time_t last_rsw_time = 0;
    std::time_t current_rsw_time1 = 0;
    int open_switch(unsigned level, float debounce_time);
    int close_switch(unsigned level, float debounce_time);
    int read_switch(unsigned level, float debounce_time);

private:
    autolock_setting *au_set;
    std::string rotate_direction;
    void rotate_right(int gpio_pin1, int gpio_pin2);
    void rotate_left(int gpio_pin1, int gpio_pin2);
};

#endif