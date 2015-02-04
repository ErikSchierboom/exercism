import java.util.*;

public final class School {

    private Map<Integer, List<String>> db = new HashMap<>();

    public Map<Integer, List<String>> db() {
        return this.db;
    }

    public void add(String student, int grade) {
        List<String> grades = this.grade(grade);
        grades.add(student);

        this.db.put(grade, grades);
    }

    public List<String> grade(int grade) {
        return this.db.getOrDefault(grade, new ArrayList<>());
    }

    public Map<Integer, List<String>> sort() {
        Map<Integer, List<String>> sortedDb = new HashMap<>();

        this.db.forEach((grade, students) -> {
            Collections.sort(students);
            sortedDb.put(grade, students);
        });

        return sortedDb;
    }
}