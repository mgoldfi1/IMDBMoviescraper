
class Scraper

def self.opening_week
link = "https://www.imdb.com/movies-in-theaters/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=2413b25e-e3f6-4229-9efd-599bb9ab1f97&pf_rd_r=A0D1KH4G3MV4GVJA3AS1&pf_rd_s=right-2&pf_rd_t=15061&pf_rd_i=homepage&ref_=hm_otw_hd"
search = Nokogiri::HTML(open(link))
opening = []
search.css(".list.detail.sub-list")[0].css(".overview-top").each do |movie|
    search_hash = {}
    search_hash[:status] = "opening"
    search_hash[:name] = movie.css("h4 a").text
    search_hash[:runtime] =  movie.css("p time").text
    search_hash[:description] = movie.css(".outline").text.gsub("    ","").gsub("                ","")
    search_hash[:rating] = movie.css("p img").attribute('title').value unless movie.css("p img").empty?
    link = movie.css("h4 a").attribute('href').value
    search_hash[:stars] = self.get_stars(link)
    opening << search_hash
end
opening
end

def self.in_theaters
link = "https://www.imdb.com/movies-in-theaters/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=2413b25e-e3f6-4229-9efd-599bb9ab1f97&pf_rd_r=A0D1KH4G3MV4GVJA3AS1&pf_rd_s=right-2&pf_rd_t=15061&pf_rd_i=homepage&ref_=hm_otw_hd"
search = Nokogiri::HTML(open(link))
in_theaters = []
search.css(".list.detail.sub-list")[1].css(".overview-top").each do |movie|
      search_hash = {}
      search_hash[:status] = "intheaters"
      search_hash[:name] = movie.css("h4 a").text
      search_hash[:runtime] =  movie.css("p time").text
      search_hash[:user_rating] = "#{movie.css("span.value").text}/10"
      search_hash[:description] = movie.css(".outline").text.gsub("    ","").gsub("                ","")
      search_hash[:rating] = movie.css("p img").attribute('title').value unless movie.css("p img").empty?
      link = movie.css("h4 a").attribute('href').value
      search_hash[:stars] = self.get_stars(link)
      in_theaters << search_hash
  end
  in_theaters
end


  def self.get_stars(link)
    url = "https://www.imdb.com#{link}"
    page = Nokogiri::HTML(open(url))
    page.css(".credit_summary_item")[2].css(".itemprop").map {|x| x.text} if page.css(".credit_summary_item")[2]
  end











end
