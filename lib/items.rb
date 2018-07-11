class MovieOpenings::Movies
attr_accessor :name, :runtime, :user_rating, :description, :rating
@@all = []

def initialize(attributes)
  attributes.each {|k, v| self.send(("#{k}="), v)}
  @@all << self
end

def self.all
  @@all
end






end
