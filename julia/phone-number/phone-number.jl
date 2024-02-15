function clean(phone_number)
    phone_number = replace(phone_number, r"[\(\)\.\-\s\+]" => "")
    all(isdigit, phone_number) || throw(ArgumentError("Invalid character(s)"))

    if length(phone_number) == 11
        phone_number[1] == '1' || throw(ArgumentError("Invalid country code"))
        phone_number = phone_number[2:end]
    end

    length(phone_number) == 10 || throw(ArgumentError("Invalid number of digits"))
    phone_number[1] ∈ '0':'1' && throw(ArgumentError("Invalid area code"))
    phone_number[4] ∈ '0':'1' && throw(ArgumentError("Invalid exchange code"))
    phone_number
end
