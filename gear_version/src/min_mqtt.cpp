#include <iostream>
#include <mosquitto.h>
#include <fstream>
#include <nlohmann/json.hpp>
#include "min_mqtt.h"
#include <string>

using json = nlohmann::json;
using namespace std;

void Mqtt::set_param(){
std::string filePath="autolock_setting.json";
float data=0;

	std::ifstream ifs(filePath);
    std::string jsonstr,buf;
    if(ifs.fail()){
        std::cout << "File Open Error" << std::endl;
    }
    
    while(!ifs.eof()){
        getline(ifs,buf);
        jsonstr+=buf;
     //   std::cout<<"[Read result] "<<jsonstr<<std::endl;
    }

    // JSON文字列をパース:
    auto jobj = json::parse(jsonstr);
    static std::string broker_address=jobj["mqtt"]["broker_address"];
    static std::string open_topic=jobj["mqtt"]["open_topic"];
    static std::string close_topic=jobj["mqtt"]["close_topic"];
    static int mqtt_port=jobj["mqtt"]["mqtt_port"];

    this->broker_address=broker_address.c_str();
    this->open_topic=open_topic.c_str();
    this->close_topic=close_topic.c_str();
    this->mqtt_port=mqtt_port;
}

void Mqtt::on_message(struct mosquitto *, void *, const struct mosquitto_message *message)
{
    std::cout << "Topic: " << message->topic << ", Message: " << (char *)message->payload << std::endl;
}

void Mqtt::clean_mqtt(){
        mosquitto_destroy(this->mosq);
        mosquitto_lib_cleanup();
}

int Mqtt::initialize_mqtt(){
    mosquitto_lib_init();

    if (!this->mosq) {
        std::cerr << "Error: Unable to create Mosquitto instance." << std::endl;
        return 1;
    }

    if (mosquitto_connect(this->mosq, this->broker_address, 1883, 60) != MOSQ_ERR_SUCCESS) {
        std::cerr << "Error: Unable to connect to the broker." << std::endl;
        this->clean_mqtt();
        return 1;
    }

    if (mosquitto_subscribe(this->mosq, NULL, this->open_topic, 0) != MOSQ_ERR_SUCCESS) {
        std::cerr << "Error: Unable to subscribe to the topic." << std::endl;
        this->clean_mqtt();
        return 1;
    }

    if (mosquitto_subscribe(this->mosq, NULL, this->close_topic, 0) != MOSQ_ERR_SUCCESS) {
        std::cerr << "Error: Unable to subscribe to the topic." << std::endl;
        this->clean_mqtt();
        return 1;
    }

    return 0;
}
