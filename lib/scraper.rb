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
    signs = self.getUrl.css("div.grid-new grid-3 div.item")
    signs.each do |item|
      input_args = {
        title: item.css('h2').text.strip,
        url: item.css('a')[0].attr('href')
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
