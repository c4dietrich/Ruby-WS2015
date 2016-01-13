module Lemma

  def datei_einlesen(pfad) #Methode um Datei enizulesen und in einem Feld zu speichern
    array = []
    i = 1
    File.open(pfad) do |file|
      while line =file.gets
        zeile = line.split("\\")
        array[i] = zeile[1..-1]
        i = i+1
      end
      puts "%d " % array.length + "Einträge"
     return array
    end
  end


  def generiere_lexikon
    include Lemma
    gow = datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gow")
    gsl = datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gsl")
    gol = datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gol")
    gmw= datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gmw")
    @wortformen = ["nil", "N", "ADJ", "Q/N", "V", "ART", "PRO", "ADV", "PRP", "KON", "ITJ"]

    @lexikon = []
    var = []
    var2 = []
    k = 1
    i = 1
    while k < gow.length
      var = gow[k][2] # speichert die Kennung
      var2 = gsl[var.to_i][2]
     @lexikon[k] = [gow[k][0], @wortformen[var2.to_i],gol[var.to_i][0], gmw[k][-1]]
     k += 1
    end
    
    p @lexikon[1..5]
  end

  def lemmatisiere_tokenliste(tokenliste,argument = nil)

    neuesLexikon = @lexikon #neues Lexikon, in dem Einträgegeändert werden
    tokens =tokenliste.split
    i = 0
    while i < tokens.length

    token = tokens[i]
    zeile = @lexikon.assoc(token) # erstes Vorkommen suchen
    index = @lexikon.find_index(zeile) #index suchen, durch den man auf den Eintrag zugreifen kann

    case argument # überschreiben der Dateien je nach dem welches Argument sie haben
      when 0
        neuesLexikon[index][0..-1] = neuesLexikon[index][2]
      when 1
        neuesLexikon[index][0..-1] = neuesLexikon[index][1,2]
      else
        if @wortformen.include?(token)
          "***"
        else
          neuesLexikon[index][0..-1] = neuesLexikon[index][2]
        end
    end

    if (token.length ==1) && (!argument)
      "+++"
    end
    i += 1
    end
    p neuesLexikon[1..5]



  end


end

include Lemma
#datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gol")
generiere_lexikon

lemmatisiere_tokenliste("abbestellen aale Abendessen",1)