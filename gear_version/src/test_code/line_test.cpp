#include <iostream>
#include <line_api.h>
#include <string.h>
#include <vector>
int main()
{
    std::string token = "token";                       // LINEアクセストークン
    std::vector<std::string> user_id = {"id1", "id2"}; // 送信先ユーザーID（複数設定可能）

    line_api line(token);

    line.send_line_message(user_id, "test");

    return 0;
}
