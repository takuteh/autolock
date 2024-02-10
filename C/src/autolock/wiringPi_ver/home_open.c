#include <stdio.h>
#include <stdint.h>
#include <wiringPi.h>

#define SERVO_PIN 19

int main(){
  if (wiringPiSetupGpio() == -1) {
     printf("cannot setup gpio.");
    return 1;
  }

  pinMode(SERVO_PIN, PWM_OUTPUT);
  pwmSetMode(PWM_MODE_MS);
  pwmSetClock(400);
  pwmSetRange(1024);
   
     pwmWrite(SERVO_PIN,70);
delay(100);
     pwmWrite(SERVO_PIN,120);
delay(800);
     pwmWrite(SERVO_PIN,70); 

  return 0;
}
