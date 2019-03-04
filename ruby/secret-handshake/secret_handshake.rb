class SecretHandshake
  ENCODED_COMMANDS = {
    0b00001 => ->(commands) { commands << 'wink' },
    0b00010 => ->(commands) { commands << 'double blink' },
    0b00100 => ->(commands) { commands << 'close your eyes' },
    0b01000 => ->(commands) { commands << 'jump' },
    0b10000 => ->(commands) { commands.reverse }
  }.freeze
  private_constant :ENCODED_COMMANDS

  def initialize(encoded_number)
    @encoded_number = encoded_number.to_i
  end

  def commands
    ENCODED_COMMANDS.inject([]) do |acc, (mask, operation)|
      encoded_number.anybits?(mask) ? operation.call(acc) : acc
    end
  end

  private

  attr_reader :encoded_number
end