require_relative 'lib/helper'

FILENAME = './data/busy_day.in'

def _set_data(hash, line)
  values = line.split(' ')

  hash['rows'], hash['columns'], hash['drones'], hash['turns'], hash['max_w'] = values

  hash
end

def _read(file)
  file.readline.strip.to_i
end

def _read_a(file)
  file.readline.strip.split.map &:to_i
end

def main
  result = {}

  File.open(FILENAME) do |f|
    _set_data(result, f.readline)
    result[:products] = {}

    result[:products].update(total: _read(f), items: [])
    product_weights = _read_a(f)

    result[:products][:total].times do |type|
      result[:products][:items] << Product.new(type, product_weights[type])
    end

    result[:warehouses] = {}
    result[:warehouses].update(total: _read(f), items: [])

    result[:warehouses][:total].times do |id|
      location = _read_a(f)
      products = _read_a(f)
      availiable_items = []

      products.each_with_index do |amount, type|
        availiable_items << [Product.new(type, product_weights[type])] * amount
      end

      result[:warehouses][:items] << Warehouse.new(id, location, availiable_items)
    end

    result[:orders] = {}
    result[:orders].update(total: _read(f), items: [])

    result[:orders][:total].times do |type|
      location = _read_a(f)
      items = _read(f)
      products = _read_a(f)
      items = []

      products.each_with_index do |amount, type|
        items << [Product.new(type, product_weights[type])] * amount
      end

      result[:orders][:items] << Order.new(type, location, items)
    end

  end
end

main
