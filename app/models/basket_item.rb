class BasketItem
  include Mongoid::Document
  embeds_one :product
  embedded_in :basket, inverse_of: :items
end
