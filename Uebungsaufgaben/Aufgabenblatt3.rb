class TextFilter
  attr_reader :text, :wortliste

  def initialize(text)
    @text = text
    @wortliste = text.split
    p text
  end

  #Aufgabe 2
  def star_generator(wort)
    ausgabe = ''
    wort.length.times {ausgabe = ausgabe + "*"}
    ausgabe
  end

 #Aufgabe 3
  def transcode(string)
    string2 = ""
    string.split.each {|x| if @wortliste.include?(x)
                            string2 = string2 + " " + star_generator(x)
                           else
                             string2 = string2 + " " + x
                           end}
    return string2
  end

  # Aufgabe 4
  def neue_woerter(wort)
    @wortliste = @wortliste + wort.split



  end

end


filter = TextFilter.new('Mist Dreck Scheiße')
puts filter.star_generator("Mist")
puts filter.transcode("Mist was für ein Dreck ist das denn?!")
filter.neue_woerter("was")
puts filter.transcode("Mist was für ein Dreck ist das denn?!")