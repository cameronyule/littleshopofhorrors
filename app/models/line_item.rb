class LineItem
  include Mongoid::Document
  field :quantity, type: Integer
  embedded_in :order
  embeds_one :product

  def self.create_from_product(product, quantity = 1)
    line_item = self.new
    line_item.product = product
    line_item.quantity = quantity
    line_item
  end

  def cost
    product.price * quantity
  end
end
