require_relative './keypad'
require "test/unit"
require 'pry'

class KeypadTest < Test::Unit::TestCase
  
  def test_hey
    message = 'HEY'
    keys = ["MGJ", "YIZ", "DKS", "BHP", "VENA", "FLQ", "URT", "CWOX"]
    comb = Keypad.new(config: keys, message: message)
    assert_equal 4, comb.result
  end

  def test_OCWQQDH
    message = 'OCWQQDH'
    keys = ["WPL", "HTVG","QIN","YSMX","KAF","OCJ","UZR","DEB"]
    comb = Keypad.new(config: keys, message: message)
    assert_equal 8, comb.result
  end

  def test_learnit
    message = 'LEARN IT'
    keys = ["LAP","RHO","IVQW","SKJ","TZU","MDX","NGYC","BEF"]
    comb = Keypad.new(config: keys, message: message)
    assert_equal 4, comb.result
  end

  def test_carlos
    message = 'CARLOS ANDRES'
    keys = ["LAP","RHO","IVQW","SKJ","TZU","MDX","NGYC","BEF"]
    comb = Keypad.new(config: keys, message: message)
    assert_equal 3136, comb.result
  end
end
