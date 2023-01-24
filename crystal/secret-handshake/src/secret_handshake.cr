module SecretHandshake
  def self.commands(secret : Number) : Array(String)
    Command.values.each_with_object([] of String) do |command, words|
      command.apply(secret, words)
    end
  end

  @[Flags]
  enum Command
    Wink
    DoubleBlink
    CloseYourEyes
    Jump
    Reverse

    def apply(secret, words)
      return if (secret & self.value).zero?

      case self
      when Wink          then words.push("wink")
      when DoubleBlink   then words.push("double blink")
      when CloseYourEyes then words.push("close your eyes")
      when Jump          then words.push("jump")
      when Reverse       then words.reverse!
      end
    end
  end
end
