class SecretHandshake
  ENCODED_COMMANDS = {
    1 << 0 => ->(commands) { commands << 'wink' },
    1 << 1 => ->(commands) { commands << 'double blink' },
    1 << 2 => ->(commands) { commands << 'close your eyes' },
    1 << 3 => ->(commands) { commands << 'jump' },
    1 << 4 => ->(commands) { commands.reverse }
  }.freeze
  private_constant :ENCODED_COMMANDS

  def initialize(encoded_number)
    @encoded_number = encoded_number.to_i
  end

  def commands
    ENCODED_COMMANDS
      .select { |mask, _| encoded_number.anybits?(mask) }
      .each_value
      .reduce([]) { |commands, operation| operation.call(commands) }
  end

  private

  attr_reader :encoded_number
end