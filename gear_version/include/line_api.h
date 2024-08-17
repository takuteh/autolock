#ifndef LINE_API_H
#define LINE_API_H

#include <string.h>
#include <vector>

class line_api
{
public:
    line_api(autolock_setting &set);
    std::string channel_token;
    std::vector<std::string> UserIds;
    bool sendLineMessage(std::string message);
};
#endif