const SILENCE_REPLY: &str = "Fine. Be that way!";
const FORCEFUL_QUESTION_REPLY: &str = "Calm down, I know what I'm doing!";
const SHOUT_REPLY: &str = "Whoa, chill out!";
const QUESTION_REPLY: &str = "Sure.";
const DEFAULT_REPLY: &str = "Whatever.";

pub fn reply(message: &str) -> &str {
    match message {
        _ if is_silence(message) => SILENCE_REPLY,
        _ if is_forceful_question(message) => FORCEFUL_QUESTION_REPLY,
        _ if is_shout(message) => SHOUT_REPLY,
        _ if is_question(message) => QUESTION_REPLY,
        _ => DEFAULT_REPLY,
    }
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
