require './helper.rb'

class Planner
  attr_accessor :time, :warehouses, :drones, :orders

  def initialize(warehouses, drones, orders)
    @time = 0
    @warehouses = warehouses
    @drones = drones
    @free_drones = drones
    @busy_drones = []
    @orders_to_deliver = orders
    @command_history = []
  end

  def simulate(max_time)
    current_time = 0
    step = 10

    while current_time < max_time
      estimate_orders

      current_time += step
    end
  end

  def estimate_orders
    cost_heap = Heap.new
    drones_ids = {}
    orders_ids = {}

    orders_to_deliver.each do |order|
      free_drones.each do |drone|
        time = order.delivery_by(drone)
        cost_heap.add([time, drone.id, order.id])
        drones_ids[drone.id] = true
        orders_ids[order.id] = true
      end
    end

    while cost_heap.has_items?
      best = cost_heap.pop
      if drones_ids[best[1]] && orders_ids[best[2]]
        @command_history << drone.delivers(order)
        drones_ids[best[1]] = nil
        orders_ids[best[2]] = nil
      end
    end
  end
end
