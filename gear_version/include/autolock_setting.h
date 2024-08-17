#ifndef AUTOLOCK_SETTING_H
#define AUTOLOCK_SETTING_H

class autolock_setting
{
public:
    autolock_setting(std::string setting_file);
    bool load_setting();
    const char *broker_address;
    const char *open_topic;
    const char *close_topic;
    const char *relay_topic;
    const char *channel_token;
    int mqtt_port;
    std::string setting_file;

private:
    std::string Broker_address;
    std::string Open_topic;
    std::string Close_topic;
    std::string Relay_topic;
    std::string Channel_token;
};

#endif