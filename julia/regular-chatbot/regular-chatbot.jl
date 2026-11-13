is_valid_command(msg) = occursin(r"^chatbot"i, msg)

remove_emoji(msg) = replace(msg, r"emoji\d+" => "")

function check_phone_number(number)
    if occursin(r"^\(\+\d{2}\) \d{3}\-\d{3}\-\d{3}$", number)
        "Thanks! You can now download me to your phone."
    else
        "Oops, it seems like I can't reach out to $number"
    end
end

getURL(msg) = [m.match for m in eachmatch(r"(\w+\.\w+)", msg)]

function nice_to_meet_you(str)
    m = match(r"^(?<surname>\w+), (?<name>\w+)$", str)
    "Nice to meet you, $(m["name"]) $(m["surname"])"
end
