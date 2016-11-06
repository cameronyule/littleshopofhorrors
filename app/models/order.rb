class Order
  include Mongoid::Document

  belongs_to :shopper
  embeds_many :line_items

  def self.create_from_basket(basket)
    order = self.new

    # Create a line item for each unique product in the basket
    # Increase the line item quantity for duplicate products
    grouped_items = basket.items.group_by{|i| i.product.id.to_s }
    grouped_items.each do |group|
      items = group.last
      item = items.first
      product = item.product
      line_item = LineItem.create_from_product(product, items.count)
      order.line_items << line_item
    end

    order
  end

  def total
    line_items.reduce(0) {|acc, line_item| acc += line_item.cost }
  end
end
