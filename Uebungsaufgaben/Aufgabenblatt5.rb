class Lemma

  def initialize(dokument)
    @text = dokument
    @token_list = dokument.split


  end

  def to_s

  end


 def lemmatisator(wort)
  # liest gow datein ein, jede zeile wird gesplitet und das erste und dritte element in ein array gepackt
   array = Array.new
  File.open("/Users/clari/Documents/Uni/Skriptsprache/gow") do |file|
   while line=file.gets
     var = line.split("\\")
     array << [var[1], var[3]]

   end


   #p array.length
   #p array[0,5]


  end
  #liest gol datei ein, 0tes und 1stes element jeder zeile wird in ein array gesteckt
  arrayGOL= Array.new(1)
  File.open("/Users/clari/Documents/Uni/Skriptsprache/gol") do |file|
    while line =file.gets
      var2 = line.split("\\")
      arrayGOL << [var2[0], var2[1]]

    end


   # p array2[0,5]

  end
    # gmw datei wird eingelesen, das letzte element jeder zeile kommt in ein array2
   arrayMW= Array.new
   array2 = Array.new
   File.open("/Users/clari/Documents/Uni/Skriptsprache/gmw") do |file|
     while line = file.gets
       var2 = line.split("\\")
       arrayMW << [var2[1],var2[3], var2[-1]]
       array2 << var2[-1]
     end


     # p array2[0,5]

   end

  count = 0
  count2 =1
   # wenn das array an der stelle count das eingebene wort enthält, wird dieses wort in index gespeichert
  while count2 != 0
    if array[count].include?(wort)
      arr = array[count]
      index = arr[1]
      lemmaform = arrayGOL[index.to_i] # gol von wort
      morphologischeform = array2[index.to_i] # gmw von wort
      count2 = 0
  else
     count += 1

    end

  end

   puts "Das Lemma zu \" #{wort} \" ist \" #{lemmaform[1]} \" , #{morphologischeform} "

 end

  def lemmatisiereString(string)
    #zerteilt eingabestring in "worte" in ein array und wendet den lemmatisator für alle elemente des arrays an
    worte = Array.new
    worte = string.split
    count = 0
    while count < worte.length
      lemmatisator(worte[count])
      count += 1
    end

  end

end



p test = Lemma.new("Test beispiel")

#puts "an".include?('a')
test.lemmatisator("bibbern")
test.lemmatisiereString("abbestellte blühe aalt kleiner")