require_relative "../lib/scraper.rb"
require_relative "../lib/zodiacsign.rb"
require "nokogiri"
require "open-uri"
require "pry"


class CLI 

  def self.run
    makeSigns
    add_attributes_to_signs
    display_signs
  end 
  
  def makeSigns
    signs_array = Scraper.scrape_index_page
    ZodiacSign.create_from_collection(signs_array)
  end
  
  def add_attributes_to_signs
    ZodiacSign.all.each do |sign|
      attributes = Scraper.scrape_info(sign.url)
      ZodiacSign.add_attributes(attributes)
    end
  end

  def display_signs
    ZodiacSign.all.each do |signs|
      puts "#{ZodiacSign.sign}"
      puts " #{ZodiacSign.sign_dates}"
      puts " #{ZodiacSign.url}"
      puts "#{ZodiacSign.horoscope}"
      puts " #{ZodiacSign.today_date}"
    end
  end
  
end 

CLI.run

 
