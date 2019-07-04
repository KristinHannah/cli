require "nokogiri"
require "open-uri"
require "pry"
require_relative "../lib/sign.rb"
require_relative "../lib/cli.rb"

class Scraper 

  def self.getUrl
    html = Nokogiri::HTML(open("https://www.horoscope.com/us/index.aspx"))
    html
  end 
  
  def self.scrape_index_page
    signs_list = []
   self.getUrl.css("div.grid.grid-6 a").each do |item|
      signs_list << {
        :sign => item.css('h3').text,
        :url => "https://www.horoscope.com" + item.attribute('href').value,
        :sign_dates => item.css('p').text
      }
    end
    signs_list
  end
  
  
  def self.scrape_info(sign)
  url = sign.url
  html = Nokogiri.HTML(open(url))
  
   sign.today_date = html.css("div.grid.grid-right-sidebar div p strong.date").text
   
      horoscopeAllText = html.css("div.grid.grid-right-sidebar div p").text
      allTextArray = horoscopeAllText.split(" - ")
      horoscope_text = allTextArray[1]
      horoscope_split = horoscope_text.split("Confused about")
      horoscope_only = horoscope_split[0]
   sign.horoscope = horoscope_only
   
       link_info = html.css("div.grid.grid-right-sidebar div.more-btns.more-horoscopes a#src-horo-btn-love").attribute('href').value
   sign.love_link = "https://www.horoscope.com" + link_info
  end
  
  def self.scrape_love_info(sign)
    url = sign.love_link
    html = Nokogiri.HTML(open(url))
   
      loveFullText = html.css("div.grid.grid-right-sidebar p").text
      loveArray1 = loveFullText.split(" - ")
      horo = loveArray1[1]
      horoSplit = horo.split("Meet highly")
   sign.love_scope = horoSplit[0]
    
  end 
    
end

Scraper.scrape_index_page
Scraper.scrape_love_info("https://www.horoscope.com/us/horoscopes/love/horoscope-love-daily-today.aspx?sign=1")
