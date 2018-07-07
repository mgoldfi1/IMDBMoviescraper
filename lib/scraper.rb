require 'nokogiri'
require 'open-uri'
require 'pry'
#class Scraper

def url_generator(user_input)
keywords = user_input.split(" ")
default = "https://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Dpets&field-keywords="
  keywords.map do |x|
  default << "#{x}++"
  end
  default
end


def url_scraper
search = Nokogiri::HTML(open(url_generator(user_input)))
hash_array = []
count = 0
until count == 10
  search.css("ul li").each do |item|
    search_hash = {}
    search_hash[:price] = item.css("a span.a-offscreen").text.gsub("$","")
    search_hash[:name] =  item.css("h2 span.a-offscreen").text
    hash_array << search_hash
    count += 1
  end
  hash_array
end















end
