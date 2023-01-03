#include<stdio.h>
#include<wiringPi.h>
#include<stdlib.h>
#include<unistd.h>

int main(void){
#define PIN 9
#define PIN_RSW 3
int i,m;

if(wiringPiSetupGpio() ==  -1) return 1;
pinMode(PIN, INPUT);
pinMode(PIN_RSW,INPUT);
pullUpDnControl(PIN_RSW,PUD_DOWN);

while(1){
 i=digitalRead(PIN);
 m=digitalRead(PIN_RSW);
   if(i==1){ //m=リードスイッチに電流が流れたら
  	delay(800);
  	printf("ON\n");
   }else{
       delay(800);
	printf("OFF\n"); 
   }

}

return 0;
}
