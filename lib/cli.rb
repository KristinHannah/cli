require_relative "../lib/scraper.rb"
require_relative "../lib/zodiacsign.rb"
require "nokogiri"
require "open-uri"
require "pry"


class CLI 
  attr_accessor :link, :scopeslibrary 
  @@all = []
  
  def initialize(link = "https://www.horoscope.com/us/index.aspx")
    @link = link 
    new = Scraper.new(link)
    @scopeslibrary = new.create_from_collection
    @@all << self 
  end 
  
  def run
    puts "CLI is running"
  end 
  
  def self.make_signs
    signs_array = Scraper.scrape_index_page
    ZodiacSign.create_from_collection(signs_array)
  end
  
end 

CLI.make_signs
ZodiacSign.all 

 
