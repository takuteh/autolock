#ifndef AUTHORIZE_USER_H
#define AUTHORIZE_USER_H

#include <string>
#include <user_info.h>

class AuthorizeUser
{

public:
    AuthorizeUser(std::string db_setting_file);
    bool authorize(UserInfo &user_info, std::string app);

private:
    std::string host;
    std::string user;
    std::string password;
    std::string database;
    std::string table;
};
#endif