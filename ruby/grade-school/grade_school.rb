class School
  def initialize
    @grade_to_students = Hash.new([])
  end

  def students(grade)
    grade_to_students[grade]
  end

  def students_by_grade
    grade_to_students.sort.map {|grade, students| {grade: grade, students: students}}
  end

  def add(student, grade)
    grade_to_students[grade] += [student]
    grade_to_students[grade].sort!
  end

  private
  attr_accessor :grade_to_students
end