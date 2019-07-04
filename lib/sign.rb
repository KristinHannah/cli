require "nokogiri"
require "open-uri"
require "pry"
require_relative "./scraper.rb"
require_relative "./cli.rb"

class ZodiacSign
  attr_accessor :sign, :sign_dates, :url, :horoscope, :love_link, :today_date, :love_scope
  @@all = []
  
  def initialize(sign_hash)
    sign_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
end 