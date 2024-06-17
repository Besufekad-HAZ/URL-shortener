class ShortCode
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length


  def self.encode(number)
    result = ""

    while number > 0 do
      index = number % BASE
      char = ALPHABET[index]
      result.prepend char
      number = number / BASE
    end

    result
  end

  def self.decode(string)
    # alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  end
end
