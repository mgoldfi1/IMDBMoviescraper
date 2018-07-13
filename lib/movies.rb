class MovieOpenings::Movies
  attr_accessor :name, :runtime, :user_rating, :description, :rating, :stars, :status
@@all = []

  def initialize(attributes)
    attributes.each {|k, v| self.send(("#{k}="), v)}
    @@all << self
  end

  def self.find_by_status(status)
    self.all.select {|m| m.status == status}
  end

  def self.all
    @@all
  end


end
