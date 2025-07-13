#include <iostream>
#include <mosquitto.h>
#include <fstream>
#include <nlohmann/json.hpp>
#include <min_mqtt.h>
#include <string>
#include <autolock_setting.h>

using json = nlohmann::json;
using namespace std;

void Mqtt::on_message(struct mosquitto *, void *, const struct mosquitto_message *message)
{
    std::cout << "Topic: " << message->topic << ", Message: " << (char *)message->payload << std::endl;
}

void Mqtt::clean_mqtt()
{
    mosquitto_destroy(this->mosq);
    mosquitto_lib_cleanup();
}

int Mqtt::initialize_mqtt(autolock_setting &set)
{
    mosquitto_lib_init();
    const char *sub_topics[] = {
        set.open_topic,
        set.close_topic,
        set.relay_topic,
        set.change_conf_topic,
        set.reload_conf_topic};

    if (!this->mosq)
    {
        std::cerr << "Error: Unable to create Mosquitto instance." << std::endl;
        return 1;
    }

    if (mosquitto_connect(this->mosq, set.broker_address, set.mqtt_port, 60) != MOSQ_ERR_SUCCESS)
    {
        std::cerr << "Error: Unable to connect to the broker." << std::endl;
        this->clean_mqtt();
        return 1;
    }

    size_t topic_count = sizeof(sub_topics) / sizeof(sub_topics[0]);
    for (size_t i = 0; i < topic_count; i++)
    {
        if (mosquitto_subscribe(this->mosq, NULL, sub_topics[i], 0) != MOSQ_ERR_SUCCESS)
        {
            std::cerr << "Error: Unable to subscribe to the topic." << std::endl;
            this->clean_mqtt();
            return 1;
        }
    }

    return 0;
}
