#include <pigpiod_if2.h>
#include <unistd.h>
#define RERAY 22

int main(){
int pi = pigpio_start(nullptr, nullptr);

set_mode(pi, RERAY, PI_OUTPUT);

set_pull_up_down(pi, RERAY, PI_PUD_DOWN);

gpio_write(pi,RERAY,1);
sleep(10);
gpio_write(pi,RERAY,0);
pigpio_stop(pi);

return 0;
}
