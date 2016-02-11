require_relative 'helper'

class Warehouse
  attr_accessor :id, :location, :items

  def initialize(id, location, items = [])
    @id = id
    @location = Cell.new(*location)
    @items = items
  end

end
