message(msg) = strip(msg[(findfirst(':', msg)+1):end])

log_level(msg) = lowercase(msg[(findfirst('[', msg)+1):(findfirst(']', msg)-1)])

reformat(msg) = "$(message(msg)) ($(log_level(msg)))"
