#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>
#include <string>
#include <autolock_setting.h>

using json = nlohmann::json;
using namespace std;

autolock_setting::autolock_setting(std::string setting_file)
{
    this->setting_file = setting_file;
    // デフォルト値を設定
    this->broker_address = "192.168.1.1";
    this->open_topic = "/door/open";
    this->close_topic = "/door/close";
    this->relay_topic = "/door/relay";
    this->line_channel_token = "";
    this->slack_channel_token = "";
    this->mqtt_port = 1883;
    this->load_setting();
}

bool autolock_setting::load_setting()
{

    float data = 0;

    std::ifstream ifs(this->setting_file);
    std::string jsonstr, buf;
    if (ifs.fail())
    {
        std::cerr << "File Open Error" << std::endl;
        return false;
    }

    while (!ifs.eof())
    {
        getline(ifs, buf);
        jsonstr += buf;
    }

    // JSON文字列をパース:
    auto jobj = json::parse(jsonstr);

    this->Broker_address = jobj["mqtt"]["broker_address"];
    this->Open_topic = jobj["mqtt"]["open_topic"];
    this->Close_topic = jobj["mqtt"]["close_topic"];
    this->Relay_topic = jobj["mqtt"]["relay_topic"];
    this->mqtt_port = jobj["mqtt"]["mqtt_port"]; // intなのでそのまま代入
    this->Line_channel_token = jobj["line"]["channel_token"];
    this->Slack_channel_token = jobj["slack"]["channel_token"];

    this->broker_address = this->Broker_address.c_str();
    this->open_topic = this->Open_topic.c_str();
    this->close_topic = this->Close_topic.c_str();
    this->relay_topic = this->Relay_topic.c_str();
    this->line_channel_token = this->Line_channel_token.c_str();
    this->slack_channel_token = this->Slack_channel_token.c_str();
    return true;
}