#include<stdio.h>
#include<stdint.h>
#include<wiringPi.h>
#include<stdlib.h>
#include<unistd.h>
#include<time.h>

int main(int argc,char **argv){
int pass,m,i;
struct tm tm;
char *dayofweek[] = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
#define PIN_RSW 3

if(wiringPiSetupGpio()==-1) return 1;
pinMode(PIN_RSW,INPUT);

FILE *fp;

while(1){
fp=fopen("passlog.txt","a");//ファイルを追加モードでopen

if(fp==NULL){
printf("can not open file!");
return 1;
}

printf("input password:");
scanf("%d",&pass);

 time_t t = time(NULL);
  localtime_r(&t, &tm);

  fprintf(fp,"%04d/%02d/%02d %s %02d:%02d:%02d   ",
         tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
         dayofweek[tm.tm_wday], tm.tm_hour, tm.tm_min, tm.tm_sec);//パスワード入力された日時出力

fprintf(fp,"%d\n\n",pass);

if(pass==4423){
printf("correct\n");
system("./open");
sleep(4);
 while(1){//RSW start
 m=digitalRead(PIN_RSW);
  if(m==0){ //リードスイッチに電流が流れたら
  delay(800);
   system("./close");
  break;
  }//RSW end
 }
}else{
printf("incorrect\n\n");
}
//printf("i=%d\n",i);
fclose(fp);//ファイルクローズ
}
return 0;
}
