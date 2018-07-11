#CLI controller
class MovieOpenings::CLI

  def call_opening
  scraper = Scraper.new
      scraper.opening_week.each {|movie| MovieOpenings::Movies.new(movie)}
      MovieOpenings::Movies.all.each do |x|
        puts "Title: #{x.name}"
        puts "Runtime: #{x.runtime}"
        puts "Description: #{x.description}"
      end
  end


def call_theaters
  Scraper.new.in_theaters.each {|movie| MovieOpenings::Movies.new(movie)}
  MovieOpenings::Movies.all.each_with_index do |x,index|
    puts "#{index+1}."+"#{x.name}".red
    puts "Runtime:".light_blue+" #{x.runtime}"
    puts "Description:".light_blue+"#{x.description}"
    puts "User Rating:".light_blue+" #{x.user_rating}"
  end
end




end
