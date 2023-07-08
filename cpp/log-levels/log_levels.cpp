#include <string>

namespace log_line
{
    std::string message(std::string log_line)
    {
        return log_line.substr(log_line.find(' ') + 1);
    }

    std::string log_level(std::string log_line)
    {
        return log_line.substr(1, log_line.find(']') - 1);
    }

    std::string reformat(std::string log_line)
    {
        return message(log_line) + " (" + log_level(log_line) + ")";
    }
} // namespace log_line
