# encoding: utf-8

require 'test/unit'
require File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib", "bongabdo", "base")
require File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib", "bongabdo", "core_ext")
require 'date'

class TestBongabdo < Test::Unit::TestCase
  def test_it_sets_day
    assert_equal(Bongabdo::Base.new(Date.new(2001,2,3)).day, 21)
  end
  
  def test_it_sets_month
    assert_equal(Bongabdo::Base.new(Date.new(2001,2,3)).month, 10)
  end
  
  def test_it_sets_year
    assert_equal(Bongabdo::Base.new(Date.new(2001,2,3)).year, 1407)
  end  
  
  def test_to_s
    assert(Bongabdo::Base.new(Date.new(2001,2,3)), "২১/১০/১৪০৭")
  end

  def test_month_name
    assert_equal(Bongabdo::Base.new(Date.new(2001,2,3)).month_name(2), "জ্যৈষ্ঠ")
    assert_equal(Bongabdo::Base.new(Date.new(2001,2,3)).month_name(2, 'bn'), "জ্যৈষ্ঠ")
    assert_equal(Bongabdo::Base.new(Date.new(2001,2,3)).month_name(2, 'en'), "Joishtho")
  end

  def test_long_format
    assert_equal(Bongabdo::Base.new(Date.new(2001,2,3)).long_format, "২১ মাঘ, ১৪০৭")
    assert_equal(Bongabdo::Base.new(Date.new(2001,2,3)).long_format('en'), "21 Magh, 1407")
  end
end
