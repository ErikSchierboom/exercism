class Garden
  STUDENTS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry].freeze
  INITIAL_TO_PLANT = {
    'V' => :violets,
    'C' => :clover,
    'G' => :grass,
    'R' => :radishes
  }.freeze
  private_constant :STUDENTS, :INITIAL_TO_PLANT

  def initialize(diagram, students = STUDENTS)
    top_plants, bottom_plants = top_and_bottom_plants(diagram)

    top_plants.zip(bottom_plants).zip(students.sort) do |(top, bottom), student|
      define_singleton_method student.downcase do
        top.concat(bottom)
      end
    end
  end

  private

  def top_and_bottom_plants(diagram)
    diagram.split("\n").map(&method(:plants))
  end

  def plants(encoded_plants)
    encoded_plants
      .chars
      .map { |initial| INITIAL_TO_PLANT[initial] }
      .each_slice(2)
  end
end