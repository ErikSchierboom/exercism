class SimpleCalculator
  OPERATIONS = { '+' => :+, '/' => :/, '*' => :* }.freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless OPERATIONS.key?(operation)
    raise ArgumentError unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)

    result = first_operand.send(OPERATIONS[operation], second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  rescue ZeroDivisionError => _
    'Division by zero is not allowed.'
  end
end
