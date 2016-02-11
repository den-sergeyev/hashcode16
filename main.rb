require_relative 'lib/helper'

FILENAME = './data/busy_day.in'

def _set_data(hash, line)
  values = line.split(' ')

  hash['rows'], hash['columns'], hash['drones'], hash['turns'], hash['max_w'] = values

  hash
end

result = {
  products: {},
  warehouses: {},
  orders: {},
}

def _read(file)
  file.readline.strip.to_i
end

def _read_a(file)
  file.readline.strip.split.map &:to_i
end

def main(result)
  File.open(FILENAME) do |f|
    _set_data(result, f.readline)
    result[:products].update(total: _read(f))
    result[:products].update(weights: _read_a(f))

    result[:warehouses].update(total: _read(f))
    result[:warehouses][:nodes] = []

    result[:warehouses][:total].times do |num|
      location = _read_a(f)
      products = _read_a(f)

      result[:warehouses][:nodes] << { num => { location: location, products: products } }
    end

    result[:orders].update(total: _read(f))
    result[:orders][:nodes] = []

    result[:orders][:total].times do |num|
      location = _read_a(f)
      items = _read(f)
      products = _read_a(f)

      result[:orders][:nodes] << { num => { location: location, items: items, products: products } }
    end


  end

  puts result
end

main(result)
puts Drone.new
