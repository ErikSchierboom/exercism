import java.util.*;

public final class School {

    private Map<Integer, List<String>> studentGrades = new HashMap<>();

    public Map<Integer, List<String>> db() {
        return this.studentGrades;
    }

    public void add(String student, int grade) {
        List<String> grades = this.grade(grade);
        grades.add(student);

        this.studentGrades.put(grade, grades);
    }

    public List<String> grade(int grade) {
        return this.studentGrades.getOrDefault(grade, new ArrayList<>());
    }

    public Map<Integer, List<String>> sort() {
        Map<Integer, List<String>> sortedDb = new HashMap<>();

        this.studentGrades.forEach((grade, students) -> {
            Collections.sort(students);
            sortedDb.put(grade, students);
        });

        return sortedDb;
    }
}