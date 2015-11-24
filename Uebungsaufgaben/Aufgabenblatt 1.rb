# Aufgabe 1
def befehlsgenerator(string)
  if string[-1] == "."
     string[-1]= "!"
  else
    puts "Kein Punkt vorhanden"
  end
  puts string
end

puts befehlsgenerator("Ich geh weg.")
puts befehlsgenerator("Ich geh ins Y.M.C.A.")

#aufgabe 2

def zinseszins(geldbetrag, zinssatz, jahre)

  geldbetrag *  ((1.0 + zinssatz / 100.0) ** jahre)


end


puts zinseszins(300,2,5)



# Aufgabe 3

def tokenisiere_string(string)
  string.split

end

 puts tokenisiere_string("Die 3. Aufgabe funktioniert super.")


def string_to_hash(eingabe)
  hash = { }
  tokenisiere_string(eingabe).each {|variable| hash[variable] = 1}
  return hash
end
puts string_to_hash("Die 4. Aufgabe funktioniert noch besser")