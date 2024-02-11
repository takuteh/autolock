#include"./src/auto_lock.cpp"
#include"./src/switch.cpp"
#include<unistd.h>
#include<iostream>
using std::cout;
using std::endl;

#define SERVO_PIN 19
#define BTN_PIN 9
#define RSW_PIN 3


int pi;

void pigpio_init(){
    pi=pigpio_start(0,0);
    if(pi<0){
        cout<<"pi gpio init failure..."<<endl;
    } 
}

auto_lock::Autolc autolc(pi,SERVO_PIN);
auto_lock::Switch sw(pi,BTN_PIN,RSW_PIN);

void door(){
    autolc.auto_lock(autolc.get_pulse("open"));
    sleep(4);
    while(true){
        if(sw.read_rsw()==false){
            sleep(1);
            autolc.auto_lock(autolc.get_pulse("close"));
            break;
        }
    }
}

int main(){
    pigpio_init();

    
    while(1){
        cout<<"btn:"<<sw.read_btn()<<endl;
        cout<<"rsw:"<<sw.read_rsw()<<endl;
        if(sw.read_btn()==true){
            door();
        }
    //sleep(1);
    }


    return 0;
}
