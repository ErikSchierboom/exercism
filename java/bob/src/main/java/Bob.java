public class Bob {
    public String hey(String s) {
        if (s.trim().isEmpty()) {
            return "Fine. Be that way!";
        }

        if (s.toUpperCase().equals(s) && s.matches(".*[A-Z].*")) {
            return "Whoa, chill out!";
        }

        if (s.charAt(s.length() - 1) == '?') {
            return "Sure.";
        }

        return "Whatever.";
    }
}
