# encoding: utf-8

class Fixnum

  BENGALI_NUMBERS = ["০", "১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯"]

  def to_bn
    bn = ""
    self.to_s.each_byte {|b|bn += ((b > 47 && b < 58)? BENGALI_NUMBERS[b - 48] : b.chr) }
    bn
  end
end

