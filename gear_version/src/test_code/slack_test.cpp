#include <iostream>
#include <slack_api.h>
#include <string.h>

int main()
{
    std::string token = "token";      // slackアクセストークン
    std::string channel = "#general"; // 送信先チャンネル

    slack_api slack(token);

    slack.send_slack_message(channel, "test");

    return 0;
}
