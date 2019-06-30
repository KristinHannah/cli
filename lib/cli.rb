class CLI 
  
  def run
    puts "CLI is running"
  end 
  
  def make_signs
    signs_hash = Scraper.scrape_titles
    Sign.create_from_array(students_array)
  end
  
end 