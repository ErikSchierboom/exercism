class Garden
  DEFAULT_STUDENTS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry].freeze
  PLANT_ENCODING = {'V' => :violets, 'C' => :clover, 'G' => :grass, 'R' => :radishes }
  private_constant :DEFAULT_STUDENTS, :PLANT_ENCODING

  def initialize(diagram, students = DEFAULT_STUDENTS)
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
      .each_char
      .map { |encoded_plant| PLANT_ENCODING[encoded_plant] }
      .each_slice(2)
  end
end