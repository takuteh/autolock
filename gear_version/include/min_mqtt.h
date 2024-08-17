#ifndef MIN_MQTT_H
#define MIN_MQTT_H
#include <string.h>
#include <mosquitto.h>
#include <autolock_setting.h>

class Mqtt
{
public:
    struct mosquitto *mosq;
    void on_message(struct mosquitto *, void *, const struct mosquitto_message *message);
    int initialize_mqtt(autolock_setting &set);
    void clean_mqtt();
};

#endif