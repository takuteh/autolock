#ifndef USER_INFO_H
#define USER_INFO_H

#include <string>

struct UserInfo
{
    std::string user_name;
    std::string line_user_id;
    std::string slack_user_id;
    std::string start_date;
    std::string end_date;

    std::map<std::string, std::string> toMap() const
    {
        return {
            {"user_name", user_name},
            {"line_id", line_user_id},
            {"slack_id", slack_user_id}};
    }
};
#endif