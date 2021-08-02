class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.check_stock(item) > 0
    end
  end

  def total_inventory
    total_inventory = Hash.new(0)

    @food_trucks.each do |truck|
      number = 0
      truck.inventory.each do |item, quantity|

        total_inventory[item] = {
          quantity: food_trucks_that_sell(item).sum { |vehicle| vehicle.check_stock(item)},
          food_trucks: food_trucks_that_sell(item)
        }
      end
    end
    total_inventory
  end

  def overstocked_items
    total_inventory.each do |key, value|
      require "pry"; binding.pry
    end
  end
end
