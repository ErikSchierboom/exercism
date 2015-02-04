public final class PhoneNumber {

    private static final String InvalidNumber = "0000000000";
    private String number;

    public PhoneNumber(String input) {
        this.number = getValidatedNumber(input);
    }

    public String getNumber() {
        return number;
    }

    public String getAreaCode() {
        return this.number.substring(0, 3);
    }

    public String pretty() {
        return String.format("(%s) %s-%s", this.getAreaCode(), this.number.substring(3, 6), this.number.substring(6, 10));
    }

    private static String getValidatedNumber(String input) {
        String digits = getDigits(input);

        if (digits.length() == 10) {
            return digits;
        }
        else if (digits.length() == 11 && digits.charAt(0) == '1') {
            return digits.substring(1);
        }
        else {
            return InvalidNumber;
        }
    }

    private static String getDigits(String input) {
        StringBuilder digits = new StringBuilder(input.length());

        for (int i = 0; i < input.length(); i++) {
            if (Character.isDigit(input.charAt(i))) {
                digits.append(input.charAt(i));
            }
        }

        return digits.toString();
    }
}