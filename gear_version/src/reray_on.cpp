#include <pigpiod_if2.h>

#define RERAY 22

int main(){
int pi = pigpio_start(nullptr, nullptr);

set_mode(pi, RERAY, PI_OUTPUT);

set_pull_up_down(pi, RERAY, PI_PUD_DOWN);

gpio_write(pi,RERAY,0);

return 0;
}