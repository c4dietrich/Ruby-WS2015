class TuebaDZ
  attr_accessor :satz, :saetze



  def lese_saetze (datei)
    @saetze = []

    i = 100
    File.open(datei, 'r') do |file|
      while i <10000 #!file.eof?
        zeile = file.gets
        if zeile.strip.start_with?('#BOS')
          @saetze << lese_satz(file)
        end
      i +=1
      end
    end
    #p @saetze[1]
    p "eingelesen"

  end


  def lese_satz stream
    @satz = []
    while zeile = stream.gets
      if zeile.strip.start_with?('#EOS')
        break
      else
        #p zeile
        @satz << zeile.chomp.split
      end
    end
    #p @satz[0][0]
    #p @satz.length
     @satz
  end

  def generiere_lexikon (dateipfad)
    frequenz_woerterbuch = Hash.new
    i = 0

    while i < @satz.length
    frequenz_woerterbuch[@satz[i][0]] = [@satz[i][1],@satz[i][2], @satz[i][3], frequenz(@satz[i][0])]
    #p lexikon1.keys
    #p lexikon1
      i += 1
    end

    p frequenz_woerterbuch
   # p lexikon1.keys

  end


  def frequenz (wortform)
    #lese_saetze("/Users/clari/Documents/Uni/Skriptsprache/tuebaDZ.txt")

    #p @saetze[0]
    i = 0
    freq =0

     @saetze.each{ |subarray|
       subarray.each {|x|
      if x.include?wortform
        freq += 1
      else
        #p x
      end
       }
     }

    freq

  end


  def parse_saetze(datei)
    lese_saetze(datei)
    k =0

    while k < 10
      ausgabe = "[VROOT "
      laenge = @saetze[k].size
      i = -1
    if @saetze[k][i][-1].to_i == 0
      ausgabe += "[" + @saetze[0][i][2] + " "

      while i >  (laenge * -1)
     # p var = @saetze[0][i-1][-1]
      #gefunden= @saetze[0].assoc("#"+var)
      #p gefunden
       if @saetze[k][i][0]  == "#"+@saetze[k][i-1][-1]
        ausgabe += "[ "+ @saetze[k][i-1][2]

       else
         if @saetze[k][i][-1] == @saetze[k][i-1][-1]
           ausgabe += ", " + @saetze[k][i-1][2]
         else
           if @saetze[k][i][-1] < @saetze[k][i-1][-1]
             ausgabe += " ], " + @saetze[k][i-1][2]
           else
             ausgabe += " ]"
           end

         end

       end
        i -= 1
      end


    end
    p ausgabe
      k += 1
    end

  end


  def klammern(datei)
    lese_saetze(datei)
    ausgabe1 = "[VROOT "
    k = 0
    laenge = @saetze[k].size
    p @saetze[0]
    i = -1
    if @saetze[k][i][-1].to_i == 0
      ausgabe1 += "[" + @saetze[0][i][2] + " "

      while i > laenge * -1
      index = @saetze[k][i][0]
      index = index[1..-1]
      if (index.to_i == @saetze[k][i-1][-1].to_i)
        ausgabe1 += "[ " +  @saetze[k][i-1][2]
      else
        if index.to_i < @saetze[k][i-1][-1].to_i
          # such index in letztem element der felder
          j = 0
          while j < laenge
            if index.to_i == @saetze[k][j][-1].to_i
              ausgabe1 += " [ " + @saetze[k][j][2] + " [" + @saetze[k][j][0] + "] ]"

            end
            j += 1
          end
        end
      end

      i -= 1
      end

    end
    p ausgabe1
  end

end


test = TuebaDZ.new
 #test.lese_saetze("/Users/clari/Documents/Uni/Skriptsprache/tuebaDZ.txt")
 #test.generiere_lexikon("/Users/clari/Documents/Uni/Skriptsprache/tuebaDZ.txt")

 test.parse_saetze("/Users/clari/Documents/Uni/Skriptsprache/tuebaDZ.txt")

#p test.frequenz("Alter")

 test.klammern("/Users/clari/Documents/Uni/Skriptsprache/tuebaDZ.txt")