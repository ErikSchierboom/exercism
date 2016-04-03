public class RnaTranscription {
    public static String ofDna(String dna) {
        return dna
                .replace('G', 'C')
                .replace('C', 'G')
                .replace('T', 'A')
                .replace('A', 'U');
    }
}
