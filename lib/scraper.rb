class Scraper 
  BASE_URL = 'https://www.astrology.com/horoscope/daily.html'

  def self.scrape_titles
    html = open(BASE_URL)
    doc = Nokogiri.HTML(html)
    signs = doc.css("div.grid-new grid-3 div.item")
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
