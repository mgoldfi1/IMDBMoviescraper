class MovieOpenings::Movies
attr_accessor :name, :runtime, :user_rating, :description, :rating, :stars


def initialize(attributes)
  attributes.each {|k, v| self.send(("#{k}="), v)}
end




end
