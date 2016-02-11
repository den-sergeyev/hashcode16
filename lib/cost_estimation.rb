require_relative 'helper'

module Cost
  def travel(from_point, to_point)
    (Math.sqrt((from_point.x - to_point.x) * (from_point.x-to_point.x) + (from_point.y-to_point.y)*(from_point.y-to_point.y))).ceil
  end

  def cost_unload(types)
    types
  end

  def cost_load(types)
    types
  end

  def cost_deliver(types)
    types
  end

  def travel_to_warehouse_and_deliver(current_pos, warehouse_pos, deliver_pos, load_types, deliver_types)
    travel(current_pos, warehouse_pos) +
      cost_load(load_types) +
      travel(warehouse_pos, deliver_pos) +
      cost_deliver(deliver_types)
  end
end

class Test; include Cost; end

t = Test.new
#p t.travel(Cell.new(1,10), Cell.new(10,10))
#p t.travel(Cell.new(0,0), Cell.new(3,4))
#p t.travel_to_warehouse_and_deliver(Cell.new(0,0), Cell.new(0,4), Cell.new(0,10), 3, 5)


