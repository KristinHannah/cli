require "nokogiri"
require "open-uri"
require "pry"
require_relative "../lib/sign.rb"
require_relative "../lib/cli.rb"

class Scraper 

  def self.getUrl
    html = Nokogiri::HTML(open("https://www.horoscope.com/us/index.aspx"))
    html
    binding.pry
  end 
  
  def self.scrape_index_page
    signs_list = []
   self.getUrl.css("div.grid.grid-6 a").each do |item|
      signs_list << {
        :sign => item.css('h3').text,
        :url => "https://www.horoscope.com" + item.attribute('href').value,
        :dates => item.css('p').text
      }
    end
    signs_list
  end
  
  
  def self.scrape_info(sign)
    url = sign.url
    html = Nokogiri.HTML(open(url))
    # binding.pry
    
   sign.date = html.css("div.grid-new grid-right-sidebar p span.date").text
   sign.horoscope = html.css("div.grid-new grid-right-sidebar p").text
    #details =
    #  html.css('ul.movie-details__detail li')[2].text.split(',').map(&:strip)
  end
end

Scraper.scrape_index_page

