def response(hey_bob):
    if is_silent(hey_bob):
        return "Fine. Be that way!"
    if is_question(hey_bob) and is_shout(hey_bob):
        return "Calm down, I know what I'm doing!"
    if is_question(hey_bob):
        return "Sure."
    if is_shout(hey_bob):
        return "Whoa, chill out!"

    return "Whatever."


def is_silent(hey_bob):
    return hey_bob.strip() == ''


def is_shout(hey_bob):
    return hey_bob.upper() == hey_bob and hey_bob.lower() != hey_bob


def is_question(hey_bob):
    return hey_bob.rstrip().endswith('?')
