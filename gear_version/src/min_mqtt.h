#ifndef MIN_MQTT_H
#define MIN_MQTT_H
#include <string.h>
#include <mosquitto.h>

class Mqtt{
    public:
    void set_param();
    const char* broker_address;
    const char* open_topic;
    const char* close_topic;
    struct mosquitto *mosq;
    int mqtt_port;
    void on_message(struct mosquitto *, void *, const struct mosquitto_message *message);
    int initialize_mqtt();
    void clean_mqtt();

};

#endif