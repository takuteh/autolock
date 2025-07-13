#include <iostream>
#include <fstream>

#include <change_setting.h>

// 再帰的に incoming のすべてのキーが base に存在するかチェック
bool ChangeSetting::validate_keys(const json &base, const json &incoming)
{
    for (auto &[key, val] : incoming.items())
    {
        if (!base.contains(key))
        {
            std::cerr << "Invalid key: " << key << std::endl;
            return false;
        }
        if (val.is_object())
        {
            // ネストされている場合は再帰的にチェック
            if (!validate_keys(base.at(key), val))
            {
                return false;
            }
        }
    }
    return true;
}

// 再帰的にマージ（上書き）
void ChangeSetting::merge_json(json &base, const json &incoming)
{
    for (auto &[key, val] : incoming.items())
    {
        if (val.is_object() && base[key].is_object())
        {
            merge_json(base[key], val); // 再帰的にマージ
        }
        else
        {
            base[key] = val; // 上書き
        }
    }
}

bool ChangeSetting::apply_setting(std::string config_file, nlohmann::json change_message)
{
    bool is_applyed = false;
    // 設定ファイルの読み込み
    std::ifstream ifs(config_file);
    json config;
    ifs >> config;

    // 受け取った設定
    json incoming = {
        {"mqtt", {{"broker_address", "local_host"}, {"mqtt_port", 1883}}}};

    // 検証 → 問題なければマージ
    if (validate_keys(config, change_message))
    {
        merge_json(config, change_message);
        is_applyed = true;
        std::ofstream ofs(config_file);
        if (!ofs)
        {
            std::cerr << "Failed to write config file.\n";
            is_applyed = false;
        }
        ofs << config.dump(4); // 整形して保存
        ofs.close();
    }
    else
    {
        std::cout << "Merge aborted due to invalid key(s).\n";
    }

    return is_applyed;
}
