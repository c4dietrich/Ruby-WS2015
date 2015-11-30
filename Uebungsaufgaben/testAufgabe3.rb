require_relative 'Aufgabenblatt4.rb'
require 'minitest/autorun'

class TestDokument < MiniTest::Unit::TestCase
  def setup
    @dokument = Dokument.new("ein Test")

  end

  def test_leer
    assert_empty(@dokument.sonderzeichen)


  end


  def test_gleich
    assert_equal "Gartenhaus", @dokument.tokenisiere("(Gartenhaus+")
    assert_equal("Katze", @dokument.tokenisiere("Katze+"))
    assert_equal("Fahrrad", @dokument.tokenisiere("#!Fahrrad+"))
  end




end
