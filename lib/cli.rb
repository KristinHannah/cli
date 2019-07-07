require_relative "../lib/scraper.rb"
require_relative "../lib/zodiacsign.rb"
require "nokogiri"
require "open-uri"
require "pry"


class CLI 

  def run
    
    puts "CLI is running"
  end 
  
  def make_signs
    signs_array = Scraper.scrape_index_page
    ZodiacSign.create_from_collection(signs_array)
  end
  
  def add_attributes_to_signs
    ZodiacSign.all.each do |sign|
      attributes = Scraper.scrape_info(sign.url)
      Zodiac.add_attributes(attributes)
    end
  end

  def display_students
    Student.all.each do |student|
      puts "#{student.name.upcase}".colorize(:blue)
      puts "  location:".colorize(:light_blue) + " #{student.location}"
      puts "  profile quote:".colorize(:light_blue) + " #{student.profile_quote}"
      puts "  bio:".colorize(:light_blue) + " #{student.bio}"
      puts "  twitter:".colorize(:light_blue) + " #{student.twitter}"
      puts "  linkedin:".colorize(:light_blue) + " #{student.linkedin}"
      puts "  github:".colorize(:light_blue) + " #{student.github}"
      puts "  blog:".colorize(:light_blue) + " #{student.blog}"
      puts "----------------------".colorize(:green)
    end
  end
  
end 

CLI.make_signs
ZodiacSign.all 

 
