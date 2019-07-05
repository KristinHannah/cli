require "nokogiri"
require "open-uri"
require "pry"
require_relative "./sign.rb"
require_relative "./scraper.rb"

class CLI 
  
  def run
    puts "CLI is running"
  end 
  
  def self.make_signs
    signs_array = Scraper.scrape_index_page
    ZodiacSign.create_from_collection(signs_array)
  end
  
end 

#CLI.make_signs