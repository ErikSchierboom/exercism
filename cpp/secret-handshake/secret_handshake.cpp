#include "secret_handshake.h"

#include <algorithm>

namespace secret_handshake {
    std::vector<std::string> commands(int encoded_command) {
        std::vector<std::string> actions;

        if (encoded_command & 0b00001)
            actions.push_back("wink");
        if (encoded_command & 0b00010)
            actions.push_back("double blink");
        if (encoded_command & 0b00100)
            actions.push_back("close your eyes");
        if (encoded_command & 0b01000)
            actions.push_back("jump");
        if (encoded_command & 0b10000)
            std::reverse(actions.begin(), actions.end());

        return actions;
    }
}  // namespace secret_handshake
