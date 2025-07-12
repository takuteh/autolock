#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>
#include <stdexcept>
#include <mysql_driver.h>
#include <mysql_connection.h>

#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>

#include <authorize_user.h>

using json = nlohmann::json;

AuthorizeUser::AuthorizeUser(std::string db_setting_file)
{
    std::ifstream ifs(db_setting_file);
    std::string jsonstr, buf;
    if (ifs.fail())
    {
        std::cerr << "File Open Error" << std::endl;
    }

    while (!ifs.eof())
    {
        getline(ifs, buf);
        jsonstr += buf;
    }

    // JSON文字列をパース:
    auto jobj = json::parse(jsonstr);

    this->host = jobj["host"];
    this->user = jobj["user"];
    this->password = jobj["password"];
    this->database = jobj["database"];
    this->table = jobj["table"];
}

bool AuthorizeUser::authorize(UserInfo &user_info, std::string app)
{
    std::string key;
    std::string value;
    bool is_authorized = false;

    auto user_map = user_info.toMap();

    if (app == "MQTT")
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
        con = driver->connect(this->host, this->user, this->password);

        // DB選択
        con->setSchema(this->database);

        // クエリ実行
        stmt = con->createStatement();
        res = stmt->executeQuery("SELECT * FROM " + this->table + " WHERE " + key + " = '" + value + "'");

        while (res->next())
        {
            std::cout << "id: " << res->getInt("id") << ", name: " << res->getString("user_name") << ", line_id: " << res->getString("line_id") << ", slack_id: " << res->getString("slack_id") << ", start_date: " << res->getString("start_date") << ", end_date: " << res->getString("end_date") << std::endl;
            is_authorized = true;
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

    return is_authorized;
}
