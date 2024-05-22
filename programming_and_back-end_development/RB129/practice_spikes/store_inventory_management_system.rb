class Stock
  def initialize
    @stock = []
  end

  def add(name, price, quantity)
    @stock << Item.new(name, price, quantity)
  end

  def update_stock(name, quantity)
    index = @stock.find_index {|item| item.name == name }

    if index
      @stock[index].quantity = quantity
      puts "Success. The '#{name}' has been updated to #{quantity} items."
    else
      puts 'Fail. Item is not found.'
    end
  end

  def show
    print_heading
    puts @stock.each(&:to_s)
  end

  def show_item(name)
    item = @stock.find {|item| item.name == name }

    if item
      print_heading
      puts item
    else
      puts 'Item is not found.'
    end
  end

  private

  def print_heading
    names = ['Name', 'Price', 'Quantity']
    names.each { |column| print column.ljust(15) }
    puts ''
  end
end

class Item
  attr_accessor :name, :price, :quantity

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end

  def to_s
    output = ''

    [name, price, quantity].map(&:to_s).each do |column|
      output += column.ljust(15)
    end

    output
  end
end

stock = Stock.new

stock.add('Screw 6x30', 0.05, 500)
stock.add('Washer D6', 0.02, 1000)
stock.add('Bolt 6x50', 0.15, 1000)
stock.add('Nut D6', 0.08, 1000)
stock.show
stock.update_stock('Bolt 6x50', 1500)
stock.show_item('Bolt 6x50')

=begin
STORE INVENTORY MANAGEMENT SYSTEM

You are tasked with implementing a program that simulates a basic inventory
management system for a small store. The store has a limited number of items
in stock, and the system should allow for adding items to the inventory,
updating the stock levels, and retrieving the current stock levels for each
item.

Your program should have the following functionalities:
Add an item to the inventory: Allow the user to input the name, price,
and initial stock level for a new item and add it to the inventory. 
Update stock levels: Allow the user to update the stock level of an existing
item in the inventory by specifying the item name and the new stock level.
Retrieve stock levels: Allow the user to retrieve the current stock level
for a specific item in the inventory by specifying the item name.
=end
