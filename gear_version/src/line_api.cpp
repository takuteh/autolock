#include <iostream>
#include <string>
#include <vector>
#include <curl/curl.h>
#include <autolock_setting.h>
#include <line_api.h>

line_api::line_api(autolock_setting &set)
{
    this->channel_token = set.channel_token;
    this->UserIds = {"Ua4ee41b47723bc9d3d55a8f62a00781f"};
    // const & userIds,
}

bool line_api::sendLineMessage(std::string message)
{
    CURL *curl;
    CURLcode res;
    std::string url = "https://api.line.me/v2/bot/message/multicast"; // マルチキャスト用

    // ヘッダーの設定
    struct curl_slist *headers = nullptr;
    headers = curl_slist_append(headers, ("Authorization: Bearer " + this->channel_token).c_str()); // リストに新しいヘッダーを追加
    headers = curl_slist_append(headers, "Content-Type: application/json");                         // 送信データをJSON形式に設定

    // JSONデータの作成
    std::string jsonData = "{ \"to\": [";
    for (size_t i = 0; i < this->UserIds.size(); ++i)
    {
        jsonData += "\"" + this->UserIds[i] + "\"";
        if (i < this->UserIds.size() - 1)
        {
            jsonData += ",";
        }
    }
    jsonData += "], \"messages\": [{\"type\":\"text\",\"text\":\"" + message + "\"}] }";

    // curl 初期化・ハンドルの取得
    curl = curl_easy_init();
    if (curl)
    {
        curl_easy_setopt(curl, CURLOPT_URL, url.c_str());             // リクエスト送信URL指定
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);          // リクエストに含むヘッダー設定
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, jsonData.c_str()); // リクエストの本文設定

        // HTTPリクエスト送信
        res = curl_easy_perform(curl);
        if (res != CURLE_OK)
            std::cerr << "curl_easy_perform() failed: " << curl_easy_strerror(res) << std::endl;

        std::cout << message << std::endl;
        // curl ハンドルの解放
        curl_easy_cleanup(curl);
    }

    // ヘッダーリストのメモリ解放
    curl_slist_free_all(headers);
    return CURLE_OK ? true : false;
}
