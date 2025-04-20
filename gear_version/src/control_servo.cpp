#include <pigpiod_if2.h>
#include <control_servo.h>
#include <chrono>
#include <iostream>

#define RE_SW 3

CONTROL_SERVO::CONTROL_SERVO(int pi, std::string rotate_direction)
{
    this->pi = pi;
    this->rotate_direction = rotate_direction;
}

CONTROL_SERVO::~CONTROL_SERVO()
{
    pigpio_stop(this->pi);
}

// モーターを右方向に回転させる
void CONTROL_SERVO::rotate_right(int gpio_pin1, int gpio_pin2)
{
    set_servo_pulsewidth(this->pi, gpio_pin1, 1500);
    set_servo_pulsewidth(this->pi, gpio_pin2, 1500);
    usleep(100000);
    set_servo_pulsewidth(this->pi, gpio_pin1, 500);
    set_servo_pulsewidth(this->pi, gpio_pin2, 500);
    usleep(800000);
    set_servo_pulsewidth(this->pi, gpio_pin1, 1500);
    set_servo_pulsewidth(this->pi, gpio_pin2, 1500);
}
// モーターを左方向に回転させる
void CONTROL_SERVO::rotate_left(int gpio_pin1, int gpio_pin2)
{
    set_servo_pulsewidth(this->pi, gpio_pin1, 1500);
    set_servo_pulsewidth(this->pi, gpio_pin2, 1500);
    usleep(100000);
    set_servo_pulsewidth(this->pi, gpio_pin1, 2500);
    set_servo_pulsewidth(this->pi, gpio_pin2, 2500);
    usleep(800000);
    set_servo_pulsewidth(this->pi, gpio_pin1, 1500);
    set_servo_pulsewidth(this->pi, gpio_pin2, 1500);
}

void CONTROL_SERVO::open(int gpio_pin1, int gpio_pin2)
{
    if (this->rotate_direction == "left")
    {
        this->rotate_left(gpio_pin1, gpio_pin2);
    }
    else if (this->rotate_direction == "right")
    {
        this->rotate_right(gpio_pin1, gpio_pin2);
    }
}

void CONTROL_SERVO::close(int gpio_pin1, int gpio_pin2)
{
    if (this->rotate_direction == "left")
    {
        this->rotate_right(gpio_pin1, gpio_pin2);
    }
    else if (this->rotate_direction == "right")
    {
        this->rotate_left(gpio_pin1, gpio_pin2);
    }
}

int CONTROL_SERVO::open_switch(unsigned level, float debounce_time)
{
    this->current_time = time_time();
    // 直前のボタンの押下から一定時間が経過していない場合は無視する
    if (this->current_time - this->last_button_time < debounce_time)
    {
        return 1;
    }
    if (level == 1)
    {
        this->start_rsw_time = time_time();
        std::cout << "open" << std::endl;
        this->open(19, 6);
    }
    // 最後のボタン押下時刻を更新
    this->last_button_time = this->current_time;
    return 0;
}

int CONTROL_SERVO::close_switch(unsigned level, float debounce_time)
{
    this->current_time = time_time();
    // 直前のボタンの押下から一定時間が経過していない場合は無視する
    if (this->current_time - this->last_button_time < debounce_time)
    {
        return 1;
    }
    if (level == 1)
    {
        if (gpio_read(pi, RE_SW) == 1)
        { // リードセンサーに反応がない場合無視する
            std::cout << "The door is open so ignore it" << std::endl;
            return 1;
        }
        std::cout << "close" << std::endl;
        this->close(19, 6);
    }
    // 最後のボタン押下時刻を更新
    this->last_button_time = this->current_time;
    return 0;
}

int CONTROL_SERVO::read_switch(unsigned level, float debounce_time)
{
    if (level == 0)
    {
        std::cout << "read_sw" << std::endl;
        sleep(2); // 完全に扉が閉まるまで待機
        this->close(19, 6);
    }
    return 0;
}
