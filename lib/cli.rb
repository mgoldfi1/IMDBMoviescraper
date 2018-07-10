#CLI controller
class MovieOpenings::CLI

  def call
    user_input = gets.strip
    if user_input == 1
      Scraper.new.opening_week.each {|movie| MovieOpenings::Movies.new(movie)}
      MovieOpenings::Movies.all.each do |x|
        puts "Title: #{x.name}"
        puts "Runtime: #{x.runtime}"
        puts "Description: #{x.description}"
      end
      elsif user_input == 2
        Scraper.new.in_theaters.each {|movie| MovieOpenings::Movies.new(movie)}
        MovieOpenings::Movies.all.each do |x|
          puts "Title: #{x.name}"
          puts "Runtime: #{x.runtime}"
          puts "Description: #{x.description}"
          binding.pry
      end
    end
end





end
