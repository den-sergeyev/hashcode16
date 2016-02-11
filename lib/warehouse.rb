require_relative 'helper'

class Warehouse
  attr_accessor :id, :location, :items

  def initialize(id, location_x, location_y, availiable_items = nil)
    @id = id
    @location = Cell.new(location_x, location_y)
    @availiable_items = availiable_items || {}
  end

end
