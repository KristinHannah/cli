require "nokogiri"
require "open-uri"
require "pry"


class Scraper 

  def self.getUrl
    html = Nokogiri::HTML(open("https://www.horoscope.com/us/index.aspx"))
    html
    binding.pry
  end 
  
  def self.scrape_titles
    signs = self.getUrl.css("section.choose-zodiac div.grid grid-6 a")
    signs.each do |item|
      input_args = {
        sign: item.css('h3').text.strip,
        url: item.css('a')[0].attr('href'),
        dates: item.css('p').text.strip
      }
      Sign.new(input_args)
    end
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

Scraper.scrape_titles
