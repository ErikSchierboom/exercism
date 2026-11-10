using Base.Iterators

function get_transmit_sequence(message)
    bits = reverse.(digits.(UInt8, message; base=2, pad=8))
    chunks = reverse.(collect(partition(flatten(bits), 7)))

    encoded = []

    for chunk in chunks
        prepend!(chunk, zeros(UInt8, 8 - length(chunk))...)
        response_chunk = UInt8(evalpoly(2, chunk))
        response_chunk |= UInt8(count_ones(response_chunk) % 2)
        push!(encoded, response_chunk)
    end

    encoded
end

function decode_sequence(received_seq)
    bits = UInt8[]

    for chunk in received_seq
        count_ones(chunk) % 2 == 0 || error("Parity check failed")

        chunk_bits = reverse(digits(UInt8, chunk; base=2, pad=8))
        append!(bits, chunk_bits[begin:7])
    end

    map(partition(bits[begin:(end-end%8)], 8)) do chunk
        convert(UInt8, evalpoly(2, reverse(chunk)))
    end
end
