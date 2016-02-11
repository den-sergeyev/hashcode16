require_relative 'helper'

class Product
  attr_accessor :type, :weight

  def initialize(type, weight)
    @type = type
    @weight = weight
  end

end
