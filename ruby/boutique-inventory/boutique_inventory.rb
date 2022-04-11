class BoutiqueInventory
  def initialize(items) = @items = items

  def item_names = @items.map { |item| item[:name] }.sort
  def cheap = @items.select { |item| item[:price] < 30 }
  def out_of_stock = @items.select { |item| item[:quantity_by_size].empty? }
  def stock_for_item(name) = @items.filter_map { |item| item[:quantity_by_size] if item[:name] == name }.first
  def total_stock = @items.sum { |item| item[:quantity_by_size].values.sum }

  private
  attr_reader :items
end
