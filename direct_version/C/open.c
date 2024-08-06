#include <stdio.h>
#include <unistd.h>
#include <pigpiod_if2.h>

#define SERVO_PIN 19

int main(){
	int pi=pigpio_start(0,0);

  set_mode(pi,SERVO_PIN,PI_OUTPUT); 
    // set_servo_pulsewidth(pi,SERVO_PIN,1500);
     set_servo_pulsewidth(pi,SERVO_PIN,900);
  return 0;
}
