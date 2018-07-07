require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper

def url_generator(user_input)
keywords = user_input.split(" ")
default = "https://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Dpets&field-keywords="
  keywords.map do |x|
  default << "#{x}++"
  end
  default
end











end
