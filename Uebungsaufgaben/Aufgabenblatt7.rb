require '/Users/clari/RubymineProjects/skriptsprache/Aufgabenblatt6'
require '/Users/clari/RubymineProjects/skriptsprache/Lemmatisator'

  class TextTiling

    attr_accessor :content_words, :sentenceSize, :blockSize, :gaps, :text
    include Lemma
    include Tokenizer

    def initialize(text)
      @text = tokenisiere(text)
      @content_words = anzahl_content_words
      @sentenceSize = 20
      @blockSize = 40
      @gaps = anzahl_gaps
    end


    def anzahl_content_words(modus =nil)
      unless @text.empty?
        @content_words = lemmatisiere_tokenliste(@text, modus)
      end
    end

    def anzahl_gaps
      ga = Array.new
      i = @blockSize
      while i < (@text.length - @blockSize)
        gs << [i, block_value(@content_words[i-@blockSize..i-1], @content_words[i..i+@blockSize-1]),
               compute_vocIntro_value(@content_words[i-@blockSize..i-1], @content_words[i..i+@blockSize-1],
                                      i-@blockSize,i-1,i,i+@blockSize-1)]
        i += @sentenceSize
      end
    end

    def block_value(block1, block2)
      erg1 = erg2 = erg3 =0.0
      (block1.uniq & block2.uniq).each do |token|
        unless token == "***"
          erg1 += block1.count(token) * block2.count(token)
          erg2 += block1.count(token) **2
          erg3 += block2.count(token) **2
        end
      end
      if (erg23 = erg2 * erg3) !=0.0
        (erg1 / Math.sqrt(erg23)).round(2)
      else
        0.0
      end
    end

    def compute_vocIntro_value block1, block2, lowA, upA, lowB, upB
      resultat = 0
      block1.uniq.each do |token|
        resultat += 1 if  @text.find_index(token) &&  @text.find_index(token).between?(lowA,upA)
      end
      block2.uniq.each do |token|
        resultat += 1 if @text.find_index(token) &&  @text.find_index(token).between?(lowB, upB)
      end
      (resultat.to_f / (2 * @blockSize)).round(2)
    end

    p @lexikon


    #@content_words = @neuesLexikon






end


#p @gmw[1]

test = TextTiling.new("Die Zentrale der CSU in (zB.) München ist in die Jahre gekommen, aber ein Plakat vor dem Eingang macht derzeit deutlich, wie sich die Christsozialen modern zeigen wollen:")
#p test.anzahl_content_words(1)