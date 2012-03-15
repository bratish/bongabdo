# encoding: utf-8

module Bongabdo

  MONTHS = [
    {'bn' => "বৈশাখ", 'en' => "Boishakh"},
    {'bn' => "জ্যৈষ্ঠ",'en' => "Joishtho"},
    {'bn' => "আষাঢ়", 'en' => "Asharh"},
    {'bn' => "শ্রাবণ", 'en' => "Srabon"},
    {'bn' => "ভাদ্র", 'en' => "Bhadro"},
    {'bn' => "আশ্বিন", 'en' => "Ashwin"},
    {'bn' => "কার্তিক", 'en' => "Kartik"},
    {'bn' => "অগ্রহায়ন", 'en' => "Agrohayon"},
    {'bn' => "পৌষ", 'en' => "Poush"},
    {'bn' => "মাঘ", 'en' => "Magh"},
    {'bn' => "ফাল্গুন", 'en' => "Falgun"},
    {'bn' => "চৈত্র", 'en' => "Chaitro"}
  ]

  class Base
    attr_accessor :year, :month, :day

    def initialize(d)
      @day, @month, @year = calculate(d)
    end

    def month_name(num, lang='bn')
      MONTHS[(num % 12) - 1][lang]
    end

    def self.today
      self.new(Time.now.to_date)
    end

    def to_s(lang="bn")
      return "#{@day}/#{@month}/#{@year}" if lang == "en"
      "#{@day.to_bn}/#{@month.to_bn}/#{@year.to_bn}"
    end

    def long_format(lang="bn")
      return "#{@day} #{month_name(@month, 'en')}, #{@year}" if lang == "en"
      "#{@day.to_bn} #{month_name(@month)}, #{@year.to_bn}"
    end


    private
    def calculate(inputdate)
      days_to_add   = [17, 18, 17, 17, 17, 17, 16, 16, 16, 15, 16, 16]
      days_to_sub   = [13, 12, 14, 13, 14, 14, 15, 15, 15, 15, 14, 14]
      bn_month_day  = [31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30]

      bn_month_day[10] = 31 if inputdate.leap? #Falgun

      #Calculating Bengali Year
      bn_year = inputdate.year - 594

      bn_year += 1 if inputdate.yday >= 104 # in case of leap year

      #Calculating Month
      bn_month = inputdate.month + 8
      if inputdate.month > 4
        bn_month = inputdate.month - 4
      end

      bn_date = inputdate.day + days_to_add[inputdate.month - 1]

      if (bn_date > bn_month_day[bn_month-1]) 
        bn_month += 1
        if (bn_month > 12)
          bn_month -=  12
        end
        bn_date = inputdate.day - days_to_sub[inputdate.month-1]
      end

      if (inputdate.day < 14 &&  inputdate.month == 3  && inputdate.leap?) #1st - 15 March of leap year
        bn_date -= 1
      end

      if (inputdate.day == 14 &&  inputdate.month == 3  && inputdate.leap?) #14th March of Non Leap Year, trouble some
        bn_date = 30
        bn_month = 11
      end

      return bn_date, bn_month, bn_year
    end
  end
end

