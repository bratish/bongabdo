# encoding: utf-8

require 'test/unit'
require File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib", "bongabdo", "base")
require File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib", "bongabdo", "core_ext")
require 'date'

class TestBongabdo < Test::Unit::TestCase
  def test_to_s
    assert(Bongabdo::Base.new(Date.new(2001,2,3)), "২১/১০/১৪০৭")
  end

  def test_long_format
    assert(Bongabdo::Base.new(Date.new(2001,2,3)).long_format, "২১ মাঘ ,১৪০৭")
  end
end
