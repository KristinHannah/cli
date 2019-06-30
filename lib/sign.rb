class Sign 
  attr_accessor :sign, :dates, :url, :horoscope
  @@all = []
  
  def initialize(sign_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
end 