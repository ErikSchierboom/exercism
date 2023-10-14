BEGIN { 
    FS = ""
    Letters = "abcdefghijklmnopqrstuvwxyz"
    
    for (i = 1; i <= length(Letters); i++)
        transpose_map[substr(Letters, i, 1)] = substr(Letters, 26 - i + 1, 1)

    for (i = 0; i < 10; i++)
        transpose_map[i] = i
}

function transpose(text) {
    text = tolower(text)
    out = ""

    for (i = 1; i <= length(text); i++) {
        char = substr(text, i, 1)
        if (char in transpose_map == 1)
            out = out transpose_map[char]
    }

    return out
}

function chunk(text) {
    chunked = ""

    for (i = 1; i <= length(text); i += 5) {
        if (i > 1)
            chunked = chunked " "
        chunked = chunked substr(text, i, 5)
    }

    return chunked
}

direction == "encode" {
    print chunk(transpose($0))
}

direction == "decode" {
    print transpose($0)
}
