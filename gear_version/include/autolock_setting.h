#ifndef AUTOLOCK_SETTING_H
#define AUTOLOCK_SETTING_H
#include <vector>

class autolock_setting
{
public:
    autolock_setting(std::string setting_file);
    std::string load_setting();
    const char *broker_address;
    const char *boot_topic;
    const char *open_topic;
    const char *close_topic;
    const char *relay_on_topic;
    const char *relay_off_topic;
    const char *change_conf_topic;
    int mqtt_port;
    bool autolock;
    std::string rotate_direction;
    bool ignore_clsw;
    std::string timeout_seq;
    bool authorize_external_users;
    bool authorize_internal_users;
    std::string open_message;
    std::string close_message;
    std::string relay_on_message;
    std::string relay_off_message;
    std::string line_channel_token;
    std::string slack_channel_token;
    std::string slack_log_channel;
    std::string slack_app_operate_notify_channel;
    std::string setting_file;
    std::vector<std::string> line_user_ids;

private:
    std::string Broker_address;
    std::string Boot_topic;
    std::string Open_topic;
    std::string Close_topic;
    std::string Relay_on_topic;
    std::string Relay_off_topic;
    std::string Change_conf_topic;
};

#endif
