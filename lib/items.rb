class MovieOpenings::Items
attr_accessor :name, :price, :description
@@all = []

def initialize(name, price, description = nil)
@name = name
@price = price
@@all << self
if description
  @description = description
  end
end







end
