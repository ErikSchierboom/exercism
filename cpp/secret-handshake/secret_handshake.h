#if !defined(SECRET_HANDSHAKE_H)
#define SECRET_HANDSHAKE_H

#include <ios>
#include <vector>

namespace secret_handshake {
    std::vector<std::string> commands(int encoded_command);
}  // namespace secret_handshake

#endif // SECRET_HANDSHAKE_H
