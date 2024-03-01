encode(s) = join(map(encode, eachmatch(r"(.)(\1*)", s)))
encode(m::RegexMatch) = (isempty(m[2]) ? "" : string(length(m.match))) * m[1]

decode(s) = join(map(decode, eachmatch(r"(\d*)(.)", s)))
decode(m::RegexMatch) = m[2]^(isempty(m[1]) ? 1 : parse(Int32, m[1]))
