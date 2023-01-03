#include<wiringPi.h>
#include<stdlib.h>
#include<unistd.h>

int main(void){
#define PIN 11
#define PIN_RSW 3
int i,m;

if(wiringPiSetupGpio() ==  -1) return 1;
pinMode(PIN, INPUT);
pinMode(PIN_RSW,INPUT);

while(1){
i=digitalRead(PIN);

if(i==1){ //ボタンが押されたら
 system("./open");
 sleep(4);
 while(1){
 m=digitalRead(PIN_RSW);
  if(m==1){ //リードスイッチに電流が流れたら
  delay(800);
   system("./close");
  break;
  } 
 }
}


}

return 0;
}
