import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class DNA {

    private Map<Character, Integer> counts = new HashMap<>();
    {
        counts.put('A', 0);
        counts.put('C', 0);
        counts.put('G', 0);
        counts.put('T', 0);
    }

    private Set<Character> validNucleuotides = counts.keySet();

    public DNA(String strand) {
        for (char nucleotide: strand.toCharArray()) {
            verifyCharacter(nucleotide);
            
            counts.put(nucleotide, counts.get(nucleotide) + 1);
        }
    }

    public Integer count(Character nucleotide) {
        verifyCharacter(nucleotide);

        return counts.get(nucleotide);
    }

    public Map<Character, Integer> nucleotideCounts() {
        return counts;
    }

    private void verifyCharacter(Character nucleotide) {
        if (!validNucleuotides.contains(nucleotide)) {
            throw new IllegalArgumentException();
        }
    }
}