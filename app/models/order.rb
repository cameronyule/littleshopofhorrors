class Order
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :shopper
  embeds_many :line_items

  def populate_from_basket(basket)
    grouped_items = basket.items.group_by{|i| i.product.id.to_s }
    grouped_items.each do |group|
      key, items = group
      line_item = LineItem.create_from_product(items.first.product, items.count)
      line_items << line_item
    end

    self
  end

  def total
    line_items.reduce(0) {|acc, line_item| acc += line_item.cost }
  end
end
