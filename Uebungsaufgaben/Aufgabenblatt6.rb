require '/Users/clari/RubymineProjects/skriptsprache/Lemmatisator.rb'

module Tokenizer

  def tokenisiere(string)
    @sonderzeichen = [")","/", "(", ",", "!", "#", "-", "+", "*", "\\"]

    count = 0

    while (count < string.length)
      if @sonderzeichen.include? string[-1]
        string= string[0...-1]
      end
      if @sonderzeichen.include? string[0]
        string = string[1..-1]
      end

      count += 1
    end

    return string
  end

end

include Tokenizer

  puts  tokenisiere("+-Haus/)")
  puts tokenisiere("#Garten.!")


