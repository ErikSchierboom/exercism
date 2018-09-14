import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Allergies {
    private List<Allergen> allergies;

    public Allergies(int code) {
        allergies = determineAllergies(code);
    }

    public boolean isAllergicTo(Allergen allergen) {
        return allergies.contains(allergen);
    }

    public List<Allergen> getList() {
        return allergies;
    }

    private static List<Allergen> determineAllergies(int code) {
        return getAllergiesBitMasks()
                .entrySet()
                .stream()
                .filter(allergen -> (allergen.getKey() & code) != 0)
                .map(Map.Entry::getValue)
                .collect(Collectors.toList());
    }

    private static Map<Integer, Allergen> getAllergiesBitMasks() {
        final Map<Integer, Allergen> allergiesBitMasks = new LinkedHashMap<>();
        allergiesBitMasks.put(1 << 0, Allergen.EGGS);
        allergiesBitMasks.put(1 << 1, Allergen.PEANUTS);
        allergiesBitMasks.put(1 << 2, Allergen.SHELLFISH);
        allergiesBitMasks.put(1 << 3, Allergen.STRAWBERRIES);
        allergiesBitMasks.put(1 << 4, Allergen.TOMATOES);
        allergiesBitMasks.put(1 << 5, Allergen.CHOCOLATE);
        allergiesBitMasks.put(1 << 6, Allergen.POLLEN);
        allergiesBitMasks.put(1 << 7, Allergen.CATS);

        return Collections.unmodifiableMap(allergiesBitMasks);
    }
}