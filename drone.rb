require './helper'

class Drone
  attr_accessor :id, :location, :items

  def initialize(id, start_x, start_y, max_load)
    @id = id
    @location = Cell.new(start_x, start_y)
    @items = {}
  end
end

