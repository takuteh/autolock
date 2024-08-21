#ifndef SLACK_API_H
#define SLACK_API_H

#include <string.h>

class slack_api
{
public:
    slack_api(std::string token);
    bool send_slack_message(std::string channel, std::string message);

private:
    std::string channel_token;
    std::string slack_api_url;
};
#endif