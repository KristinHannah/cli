require "nokogiri"
require "open-uri"
require "pry"
require_relative "./sign.rb"
require_relative "./cli.rb"

class CLI 
  
  def run
    puts "CLI is running"
  end 
  
  def make_signs
    signs_hash = Scraper.scrape_titles
    Sign.create_from_array(students_array)
  end
  
end 