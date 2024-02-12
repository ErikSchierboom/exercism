ACTIONS = (
    (0b00001, handshake -> push!(handshake, "wink")),
    (0b00010, handshake -> push!(handshake, "double blink")),
    (0b00100, handshake -> push!(handshake, "close your eyes")),
    (0b01000, handshake -> push!(handshake, "jump")),
    (0b10000, handshake -> reverse!(handshake)),
)

function secret_handshake(code)
    handshake = []

    for (mask, operation) in ACTIONS
        if code & mask == mask
            operation(handshake)
        end
    end

    handshake
end
