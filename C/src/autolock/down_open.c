#include <pigpiod_if2.h>
#include <time.h>
#include <unistd.h>

#define SERVO_PIN 6
int main(){
int pi;
        //pigpio初期化
 pi=pigpio_start(0,0);
set_servo_pulsewidth(pi,SERVO_PIN,1500);
sleep(2);
 set_servo_pulsewidth(pi,SERVO_PIN,2500);
sleep(2);
 set_servo_pulsewidth(pi,SERVO_PIN,1500);
return 0;
}
