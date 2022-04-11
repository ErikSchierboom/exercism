require 'ostruct'

class BoutiqueInventory
  attr_reader :items

  def initialize(items) = @items = items.map { |item| OpenStruct.new(item) }

  def item_names = items.map(&:name).sort
  def total_stock = items.sum { |item| item.quantity_by_size.values.sum }
end
