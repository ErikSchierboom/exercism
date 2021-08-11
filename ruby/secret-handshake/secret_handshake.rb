class SecretHandshake
  def initialize(encoded_number)
    @encoded_number = encoded_number.to_i
  end

  def commands
    ENCODED_COMMANDS.each_with_object([]).with_index do |(operation, acc), left_shift|
      operation.call(acc) if encoded_number.anybits?(1 << left_shift)
    end
  end

  private
  attr_reader :encoded_number

  ENCODED_COMMANDS = [
    ->(commands) { commands << 'wink' },
    ->(commands) { commands << 'double blink' },
    ->(commands) { commands << 'close your eyes' },
    ->(commands) { commands << 'jump' },
    ->(commands) { commands.reverse! }
  ].freeze
  private_constant :ENCODED_COMMANDS
end