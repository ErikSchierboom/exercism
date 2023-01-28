class School
  def initialize = @grade_to_students = Hash.new([])

  def students(grade) = @grade_to_students[grade]
  def students_by_grade = @grade_to_students.sort.map {|grade, students| { grade:, students: }}

  def add(student, grade)
    @grade_to_students[grade] += [student]
    @grade_to_students[grade].sort!
  end
end