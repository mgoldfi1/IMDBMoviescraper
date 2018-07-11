#CLI controller
class MovieOpenings::CLI
@@openings = []
@@theater = []
  def call_opening
  scraper = Scraper.new
      scraper.opening_week.each {|movie| @@openings << MovieOpenings::Movies.new(movie)}
      self.class.openings.each_with_index do |x,index|
        puts "\n\n"
        puts "#{index+1}."+"#{x.name}".red
        puts "Rating:"+"#{x.rating}".green
        puts "Runtime:".light_blue+" #{x.runtime}"
        puts "Description:".light_blue+"#{x.description}"
      end
  end


def call_theaters
  Scraper.new.in_theaters.each {|movie| @@theater << MovieOpenings::Movies.new(movie)}
  self.class.theater.each_with_index do |x,index|
    puts "\n\n"
    puts "#{index+1}."+"#{x.name}".red
    puts "Rating:"+"#{x.rating}".green
    puts "Runtime:".light_blue+" #{x.runtime}"
    puts "Description:".light_blue+"#{x.description}"
    puts "User Rating:".light_blue+" #{x.user_rating}"
  end
end

def self.openings
  @@openings
end

def self.theater
  @@theater
end




end
