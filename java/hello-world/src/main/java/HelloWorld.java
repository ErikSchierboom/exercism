public class HelloWorld {
    public static String hello(String str) {
        if (str == null || str.length() == 0) {
            return "Hello, World!";
        }

        return "Hello, " + str + "!";
    }
}