class Dokument
  attr_reader :text, :token_list, :bekannte_abkürzungen, :sonderzeichen


  def initialize(inhalt)
    @text = inhalt
    @token_list = @text.split
    @bekannte_abkürzungen = ["etc", "usw", "u.a.", "o.ä.", "s.", "s.o.",
                             "z.B.", "d.h.", "MfG", "i.A." ]
    @sonderzeichen = [")","/", "(", ",", "!", "#", "-", "+", "*", "\'"]
  end

  def tokenisiere(string)
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

test = Dokument.new("Ein sehr kleines Dokument")
p  test.tokenisiere("+-Haus/)")
puts test.tokenisiere("#Garten!")
