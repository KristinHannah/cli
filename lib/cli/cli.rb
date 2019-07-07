require_relative "../lib/scraper.rb"
require_relative "../lib/zodiacsign.rb"
require "nokogiri"
require "open-uri"
require "pry"


class Horoscopes::CLI 

  def call 
    puts "Welcome to your fortune telling gem"  
    signsign
  end 
  
  def signsign
    puts 
      "aries 
      virgo
      sagittarius"
  end 
  
  def ask_user_bday
    puts "Please tell me your birthday in number format (August 25, 1990 would be 08/25/1990)"
      input = nil 
    while input != "exit"
      input = gets.strip 
    case input 
    when "01/01/2000"
      puts "you are a..."
    end 
  end 
  end 
  
  def goodbye
    puts "check back tomorrow for your new horoscope"
  end 
  
  #def self.run
  #  makeSigns
  # add_attributes_to_signs
  #  display_signs
  #end 
  
  #def makeSigns
  # signs_array = Scraper.scrape_index_page
  #  ZodiacSign.create_from_collection(signs_array)
  #end
  
  #def add_attributes_to_signs
  #  ZodiacSign.all.each do |sign|
  #    attributes = Scraper.scrape_info(sign.url)
   #   ZodiacSign.add_attributes(attributes)
  #  end
 # end

 # def display_signs
 #   ZodiacSign.all.each do |signs|
  #    puts "#{ZodiacSign.sign}"
  #    puts " #{ZodiacSign.sign_dates}"
  #    puts " #{ZodiacSign.url}"
   #   puts "#{ZodiacSign.horoscope}"
    #  puts " #{ZodiacSign.today_date}"
  #  end
#  end
  
end 

CLI.call

 require_relative "../lib/scraper.rb"
require_relative "../lib/zodiacsign.rb"
require "nokogiri"
require "open-uri"
require "pry"


class Horoscopes::CLI 

  def call 
    puts "Welcome to your fortune telling gem"  
    signsign
  end 
  
  def signsign
    puts 
      "aries 
      virgo
      sagittarius"
  end 
  
  def ask_user_bday
    puts "Please tell me your birthday in number format (August 25, 1990 would be 08/25/1990)"
      input = nil 
    while input != "exit"
      input = gets.strip 
    case input 
    when "01/01/2000"
      puts "you are a..."
    end 
  end 
  end 
  
  def goodbye
    puts "check back tomorrow for your new horoscope"
  end 
  
  #def self.run
  #  makeSigns
  # add_attributes_to_signs
  #  display_signs
  #end 
  
  #def makeSigns
  # signs_array = Scraper.scrape_index_page
  #  ZodiacSign.create_from_collection(signs_array)
  #end
  
  #def add_attributes_to_signs
  #  ZodiacSign.all.each do |sign|
  #    attributes = Scraper.scrape_info(sign.url)
   #   ZodiacSign.add_attributes(attributes)
  #  end
 # end

 # def display_signs
 #   ZodiacSign.all.each do |signs|
  #    puts "#{ZodiacSign.sign}"
  #    puts " #{ZodiacSign.sign_dates}"
  #    puts " #{ZodiacSign.url}"
   #   puts "#{ZodiacSign.horoscope}"
    #  puts " #{ZodiacSign.today_date}"
  #  end
#  end
  
end 

CLI.call

 