export default class GradeSchool {
    private roster: Map<string, string[]>

    constructor() {
        this.roster = new Map<string, string[]>()
    }

    public studentRoster(): Map<string, string[]> {
        const studentRoster = new Map<string, string[]>()

        for (const [grade, students] of this.roster) {
            studentRoster.set(grade, Array.from(students))
        }

        return studentRoster
    }

    public addStudent(student: string, grade: number): void {
        const students = this.roster.get(grade.toString()) || []
        students.push(student)
        students.sort()

        this.roster.set(grade.toString(), students)
    }

    public studentsInGrade(grade: number): string[] {
        return Array.from(this.roster.get(grade.toString()) || [])
    }
}