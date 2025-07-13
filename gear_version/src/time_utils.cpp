#include <ctime>
#include <iomanip>
#include <sstream>
#include <time_utils.h>
#include <chrono>
std::string TimeUtils::current_datetime_str()
{
    std::time_t now = std::time(nullptr);
    std::tm *local_time = std::localtime(&now);

    std::ostringstream oss;
    oss << std::put_time(local_time, "%Y-%m-%d %H:%M:%S");

    return oss.str();
}

std::tm TimeUtils::current_datetime_tm()
{
    auto now = std::chrono::system_clock::now();
    std::time_t time_now = std::chrono::system_clock::to_time_t(now);
    return *std::localtime(&time_now);
}

std::tm TimeUtils::parse_datetime_string(const std::string &datetime)
{
    std::tm tm = {};
    std::istringstream ss(datetime);
    ss >> std::get_time(&tm, "%Y-%m-%d %H:%M:%S");
    return tm;
} // 文字列→tm変換