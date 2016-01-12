module Lemma

  def datei_einlesen(pfad)
    array = []
    i = 1
    File.open(pfad) do |file|
      while line =file.gets
        zeile = line.split("\\")
        array[i] = zeile[1..-1]
        i = i+1
      end
     return array
    end
  end


  def generiere_lexikon
    include Lemma
    gow = datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gow")
    gsl = datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gsl")
    gol = datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gol")
    gmw= datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gmw")
    wortformen = ["nil", "N", "ADJ", "Q/N", "V", "ART", "PRO", "ADV", "PRP", "KON", "ITJ"]

    @lexikon = []
    var = []
    var2 = []
    k = 1
    i = 1
    while k < gow.length

      var = gow[k][2] # speichert die Kennung
      var2 = gsl[var.to_i][2]
     @lexikon[k] = [gow[k][0], wortformen[var2.to_i],gol[var.to_i][0], gmw[k][-1]]
     k += 1
    end
    
    #p @lexikon[5..10]
  end

  def lemmatisiere_tokenliste(tokenliste,zahl = 0)


    tokens =tokenliste.split
    p tokens[1]
    p @lexikon.find_index(tokens[2])



  end


end

include Lemma
#datei_einlesen("/Users/clari/Documents/Uni/Skriptsprache/gol")
generiere_lexikon

lemmatisiere_tokenliste("abbestelle Hunger Abendessen")