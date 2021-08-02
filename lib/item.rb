class Item
  attr_reader :name,
              :price

  def initialize(data)
    @name = data[:name]
    @price = (data[:price].tr('$', '')).to_f
  end
end
