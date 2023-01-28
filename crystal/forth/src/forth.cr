class Forth
  def self.evaluate(equation)
    Forth.new(parse(equation)).evaluate
  end

  def self.parse(equation)
    equation.downcase.scan(/(\-?\d+|[\:;\*\/\+\-]|[\w-]+)/).map &.[0]
  end

  @stack = [] of Int32
  @mapping = Hash(String, Array(String)).new

  def initialize(@operations : Array(String)); end

  def evaluate
    while (operation = @operations.shift?)
      if @mapping.has_key?(operation)
        @mapping[operation].not_nil!.reverse.each { |o| @operations.unshift(o) }
        next
      end

      case operation
      when .to_i? then number_operand(operation.to_i)
      when "+"    then binary_operation() { |s, l, r| s.push(l + r) }
      when "-"    then binary_operation() { |s, l, r| s.push(l - r) }
      when "*"    then binary_operation() { |s, l, r| s.push(l * r) }
      when "/"    then binary_operation() { |s, l, r| r.zero? ? raise ArgumentError.new : s.push(l // r) }
      when "swap" then binary_operation() { |s, l, r| s.push(r, l) }
      when "over" then binary_operation() { |s, l, r| s.push(l, r, l) }
      when "dup"  then unary_operation() { |s, v| s.push(v, v) }
      when "drop" then unary_operation() { |s, v| }
      when ":"    then define_word()
      else             raise ArgumentError.new
      end
    end

    @stack
  end

  def number_operand(n : Int32)
    @stack.push(n)
  end

  def binary_operation(&operation : (Array(Int32), Int32, Int32) -> _)
    raise ArgumentError.new if @stack.size < 2

    right = @stack.pop
    left = @stack.pop
    operation.call(@stack, left, right)
  end

  def unary_operation(&operation : (Array(Int32), Int32) -> _)
    raise ArgumentError.new if @stack.size < 1

    operand = @stack.pop
    operation.call(@stack, operand)
  end

  def define_word
    word = @operations.shift
    raise ArgumentError.new if word.to_i?

    word_operations = [] of String

    while (operation = @operations.shift?)
      break if operation == ";"

      word_operations.concat(@mapping.fetch(operation, [operation]))
    end

    @mapping[word] = word_operations
  end
end
