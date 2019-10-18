require_relative './keys3'
require "test/unit"
require 'pry'

class CombinationTest < Test::Unit::TestCase
  
  def test_hey
    message = 'HEY'
    keys = ["MGJ", "YIZ", "DKS", "BHP", "VENA", "FLQ", "URT", "CWOX"]
    comb = Combination.new(arr: keys, message: message)
    assert_equal 4, comb.total.count
  end

  def test_OCWQQDH
    message = 'OCWQQDH'
    keys = ["WPL", "HTVG","QIN","YSMX","KAF","OCJ","UZR","DEB"]
    comb = Combination.new(arr: keys, message: message)
    assert_equal 8, comb.total.count
  end

  def test_learnit
    message = 'LEARN IT'
    keys = ["LAP","RHO","IVQW","SKJ","TZU","MDX","NGYC","BEF"]
    comb = Combination.new(arr: keys, message: message)
    assert_equal 4, comb.total.count
  end
end
