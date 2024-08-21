#include <iostream>
#include <string>
#include <curl/curl.h>
#include "slack_api.h"

slack_api::slack_api(std::string token)
{
    this->channel_token = token;
    this->slack_api_url = "https://slack.com/api/chat.postMessage";
}

// メッセージ送信関数
bool slack_api::send_slack_message(std::string channel, std::string message)
{
    CURL *curl;
    CURLcode res;

    curl_global_init(CURL_GLOBAL_ALL);
    curl = curl_easy_init();
    if (curl)
    {
        struct curl_slist *headers = nullptr;
        headers = curl_slist_append(headers, ("Authorization: Bearer " + this->channel_token).c_str());
        headers = curl_slist_append(headers, "Content-Type: application/json");

        std::string payload = "{\"channel\": \"" + channel + "\", \"text\": \"" + message + "\"}";

        curl_easy_setopt(curl, CURLOPT_URL, this->slack_api_url.c_str());
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, payload.c_str());

        res = curl_easy_perform(curl);
        if (res != CURLE_OK)
        {
            std::cerr << "curl_easy_perform() failed: " << curl_easy_strerror(res) << std::endl;
            return false;
        }

        curl_slist_free_all(headers);
        curl_easy_cleanup(curl);
    }

    curl_global_cleanup();
    return true;
}
