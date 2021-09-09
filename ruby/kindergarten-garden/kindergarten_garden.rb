class Garden
  def initialize(diagram, students = STUDENTS)
    rows(diagram).zip(students.sort) do |(top, bottom), student|
      define_singleton_method student.downcase do
        top.concat(bottom)
      end
    end
  end

  private

  def rows(diagram)
    diagram.split("\n").map do |row|
      row.chars.map { |code| ENCODED_PLANTS[code] }.each_slice(2)
    end.then do |(top, bottom)|
      top.zip(bottom)
    end
  end

  STUDENTS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry].freeze
  ENCODED_PLANTS = {
    'V' => :violets,
    'C' => :clover,
    'G' => :grass,
    'R' => :radishes
  }.freeze
  private_constant :STUDENTS, :ENCODED_PLANTS
end