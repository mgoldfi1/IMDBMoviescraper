class MovieOpenings::Movies
attr_accessor :name, :runtime, :user_rating, :description
@@all = []

def initialize(attributes)
  attributes.each {|k, v| self.send(("#{k}="), v)}
  @@all << self
end

def self.all
  @@all
end






end
