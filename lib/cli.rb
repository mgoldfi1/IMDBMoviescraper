#CLI controller
class MovieOpenings::CLI

def call
  puts "Welcome to the IMDB movieopenings gem"
  loop do
  puts "If you would like to see a list of movies opening this week, please type 1.  Otherwise, type 2 to display a list of movies that are currently in theaters.  Type exit to exit the program."
  user = gets.strip
  case user
  when "1"
    puts "\n\n\n\n\n"
    call_opening
  when "2"
    puts "\n\n\n\n\n"
    call_theaters
  when "exit"
    puts "Goodbye"
    break
    end
  end
end

  def call_opening
      Scraper.opening_week.each {|movie| MovieOpenings::Movies.new(movie)}
      MovieOpenings::Movies.find_by_status("opening").each_with_index do |x,index|
        puts "\n\n"
        puts "#{index+1}."+"#{x.name}".red
        puts "Rating:  ".light_blue+"#{x.rating}".green if x.rating
        puts "Runtime:".light_blue+" #{x.runtime}"
        puts "Description:".light_blue+"#{x.description}"
        puts "Starring: ".light_blue+"#{x.stars.join(" ")}" if x.stars
      end
  end


def call_theaters
  Scraper.in_theaters.each {|movie| MovieOpenings::Movies.new(movie)}
  MovieOpenings::Movies.find_by_status("intheaters").each_with_index do |x,index|
    puts "\n\n"
    puts "#{index+1}."+"#{x.name}".red
    puts "Rating:  ".light_blue+"#{x.rating}".green if x.rating
    puts "Runtime:".light_blue+" #{x.runtime}"
    puts "Description:".light_blue+"#{x.description}"
    puts "User Rating:".light_blue+" #{x.user_rating}"
    puts "Starring: ".light_blue+"#{x.stars.join(" ")}" if x.stars
  end
end






end
