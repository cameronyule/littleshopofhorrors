class Order
  include Mongoid::Document

  belongs_to :shopper
  embeds_many :line_items

  def self.create_from_basket(basket)
    order = self.new

    byebug

    # Create a line item for each unique product in the basket
    # Increase the line item quantity for duplicate products
    grouped_products = basket.products.group_by{|p| p.id.to_s }
    grouped_products.each do |group|
      products = group.last
      line_item = LineItem.create_from_product(products.first, products.count)
      order.line_items << line_item
    end

    byebug

    order
  end

  def total
    line_items.reduce(0) {|acc, line_item| acc += line_item.cost }
  end
end
