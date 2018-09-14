public class BeerSong {

    public static String verse(int n) {
        switch (n) {
            case 0:
                return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n\n";
            case 1:
                return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\n";
            case 2:
                return "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n";
            default:
                return String.format("%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n\n", n, n, (n-1));
        }
    }

    public static String sing(int stop, int start) {
        StringBuilder builder = new StringBuilder();

        for (int i = stop; i >= start; i--) {
            builder.append(verse(i));
        }

        return builder.toString();
    }

    public static String singSong() {
        return sing(99, 0);
    }


//
//    let verse n =
//    match n with
//    | 0 -> "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
//            | 1 -> "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
//            | 2 -> "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
//            | _ -> sprintf "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n" n n (n-1)
//
//    let verses stop start =
//    [stop .. -1 .. start]
//            |> List.map (fun i -> verse i + "\n")
//            |> List.reduce (+)
//
//    let sing = verses 99 0
}