pub fn reply(message: &str) -> &str {
    if is_silence(message) {
        return "Fine. Be that way!";
    }

    if is_forceful_question(message) {
        return "Calm down, I know what I'm doing!";
    }

    if is_shout(message) {
        return "Whoa, chill out!";
    }

    if is_question(message) {
        return "Sure.";
    }

    "Whatever."
}

fn is_silence(message: &str) -> bool {
    message.trim().is_empty()
}

fn is_forceful_question(message: &str) -> bool {
    is_shout(message) && is_question(message)
}

fn is_shout(message: &str) -> bool {
    message.to_uppercase() == message && message.chars().any(|c| c.is_alphabetic())
}

fn is_question(message: &str) -> bool {
    message.trim_end().ends_with("?")
}
