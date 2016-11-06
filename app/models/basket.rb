class Basket
  include Mongoid::Document
  embedded_in :shopper
  embeds_many :items, :class_name => "BasketItem"

  def empty_items
    items.clear
  end

  def update_items(product_ids)
    items.clear
    product_ids.each do |id|
      item = BasketItem.new
      item.product = Product.find(id)
      items << item
    end
    items
  end
end
