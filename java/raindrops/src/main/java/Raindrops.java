public class Raindrops {
    public static String convert(int number) {

        String convertedNumber = "";

        if (number % 3 == 0) {
            convertedNumber += "Pling";
        }

        if (number % 5 == 0) {
            convertedNumber += "Plang";
        }

        if (number % 7 == 0) {
            convertedNumber += "Plong";
        }

        return convertedNumber.equals("") ? Integer.toString(number) : convertedNumber;
    }
}
