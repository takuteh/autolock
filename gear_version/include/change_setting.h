#ifndef CHANGE_SETTING_H
#define CHANGE_SETTING_H

#include <nlohmann/json.hpp>

using json = nlohmann::json;

class ChangeSetting
{

public:
    bool apply_setting(std::string config_file, nlohmann::json change_message);

private:
    bool validate_keys(const json &base, const json &incoming);
    void merge_json(json &base, const json &incoming);
};

#endif