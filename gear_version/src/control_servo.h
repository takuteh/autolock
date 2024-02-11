#ifndef CONTROL_SERVO_H
#define CONTROL_SERVO_H
#include <unistd.h>

class CONTROL_SERVO{
    public:
    int pi;
    CONTROL_SERVO(int pi);
    ~CONTROL_SERVO();
    void open(int gpio_pin1,int gpio_pin2);
    void close(int gpio_pin1,int gpio_pin2);


};

#endif