#include <iostream>
#include <fstream>
#include <cstdlib>
#include <stdexcept>
#include <mysql_driver.h>
#include <mysql_connection.h>

#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>

#include <authorize_user.h>
#include <time_utils.h>

TimeUtils tu;

AuthorizeUser::AuthorizeUser()
{
    this->host = std::getenv("MARIADB_HOST");
    this->port = std::stoi(std::getenv("MARIADB_PORT"));
    this->user = std::getenv("MARIADB_USER");
    this->password = std::getenv("MARIADB_PASSWORD");
    this->database = std::getenv("MARIADB_DATABASE");
    this->table = std::getenv("MARIADB_TABLE");
}

std::pair<bool, bool> AuthorizeUser::authorize(UserInfo &user_info, std::string app)
{
    std::string key;
    std::string value;
    bool is_authorized = false;
    bool is_registered = false;

    auto user_map = user_info.toMap();
    std::transform(app.begin(), app.end(), app.begin(),
                   [](unsigned char c)
                   { return std::tolower(c); });
    std::cout << app << std::endl;
    if (app == "mqtt")
    {
        key = "user_name";
    }
    else
    {
        key = app + "_id";
    }

    value = user_map[key];

    try
    {
        sql::mysql::MySQL_Driver *driver;
        sql::Connection *con;
        sql::Statement *stmt;
        sql::ResultSet *res;

        // ドライバ取得
        driver = sql::mysql::get_mysql_driver_instance();
        con = driver->connect("tcp://" + this->host + ":" + this->port , this->user, this->password);

        // DB選択
        con->setSchema(this->database);

        // クエリ実行
        stmt = con->createStatement();
        res = stmt->executeQuery("SELECT * FROM " + this->table + " WHERE " + key + " = '" + value + "'");

        while (res->next())
        {
            // tm型に統一
            std::tm now_tm = tu.current_datetime_tm();
            std::tm db_start_tm = tu.parse_datetime_string(res->getString("start_date"));
            std::tm db_end_tm = tu.parse_datetime_string(res->getString("end_date"));

            user_info.user_name = res->getString("user_name");

            // エポック秒に変換して比較
            if (std::mktime(&now_tm) > std::mktime(&db_start_tm) && std::mktime(&now_tm) < std::mktime(&db_end_tm))
            {
                std::cout << "authorized" << std::endl;
                is_authorized = true;
            }
            else
            {
                std::cout << "expired" << std::endl;
            }
            is_registered = true;
        }

        delete res;
        delete stmt;
        delete con;
    }
    catch (sql::SQLException &e)
    {
        std::cerr << "SQL Error: " << e.what() << std::endl;
        is_authorized = false;
    }
    return std::make_pair(is_authorized, is_registered);
}
