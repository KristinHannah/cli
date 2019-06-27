class Scraper 
  BASE_URL = 'https://www.marketwatch.com/investing/stock/'

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

  def self.scrape_info(movie)
    url = movie.url
    html = Nokogiri.HTML(open(url))
    # binding.pry
    details =
      html.css('ul.movie-details__detail li')[2].text.split(',').map(&:strip)
    movie.rating = details[0]
    movie.length = details[1]
  end
end
