is_pangram <- \(input) all(letters %in% strsplit(tolower(input), "")[[1]])
