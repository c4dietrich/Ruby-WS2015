class Dokument
  attr_reader :inhalt, :tokens


  def initialize(inhalt)
    @inhalt = inhalt
    @tokens = @inhalt.split
  end



  def schreibweise(wort)
    anzahl_gross = tokens.count(wort.capitalize)
    anzahl_klein = tokens.count(wort)

    puts("Das Wort #{wort} ist im Text #{anzahl_gross} mal groß geschrieben und #{anzahl_klein} mal klein geschrieben")
  end

  def kontext(wort, weit = 1)
    index_wort = @tokens.index(wort)

    p "#{tokens[index_wort]}"
    p tokens[[index_wort -weit, 0].max ... index_wort]+
          [">>#{tokens[index_wort]}<<"]+ tokens[index_wort+1..index_wort+weit]


  end

end


test_dokument = Dokument.new('Was Du du du heute kannst besorgen, dass verschiebe nicht auf morgen')
test_dokument.schreibweise("du")
test_dokument.kontext("kannst", 3)
