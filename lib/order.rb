require_relative 'helper'

class Order
  attr_accessor :id, :location, :items

  def initialize(id, x, y, items)
    @id = id
    @location = Cell.new(x, y)
    @items = items
  end
end

