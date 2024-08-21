#ifndef LINE_API_H
#define LINE_API_H

#include <vector>
#include <string.h>

class line_api
{
public:
    line_api(std::string token);
    bool send_line_message(std::vector<std::string> UserIds, std::string message);

private:
    std::string channel_token;
    std::string line_api_url;
};
#endif