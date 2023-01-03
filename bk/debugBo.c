#include<stdio.h>
#include<wiringPi.h>
#include<unistd.h>

int main(void){
#define PIN 24
#define PIN_RSW 12
int i,m;

if(wiringPiSetupGpio() ==  -1) return 1;
pinMode(PIN, INPUT);
pinMode(PIN_RSW,INPUT);

while(1){
i=digitalRead(PIN);

if(i==1){ //ボタンが押されたら
// system("./open");
printf("ボタンが押されました\n");
 sleep(1);
}else if(i==0){
printf("押されていません\n");
sleep(1);
}

m=digitalRead(PIN_RSW);
if(m==1){ //リードスイッチに電流が流れたら
  sleep(1);
   //system("./close");
printf("スイッチが反応しました\n");
  }else if(m==0){
printf("反応していません\n");
sleep(1);
 }


}

return 0;
}
