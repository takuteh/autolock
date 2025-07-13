#include <string>
#include <ctime>
class TimeUtils
{
public:
    std::string current_datetime_str();
    std::tm current_datetime_tm();
    std::tm parse_datetime_string(const std::string &datetime); // 文字列→tm変換
};