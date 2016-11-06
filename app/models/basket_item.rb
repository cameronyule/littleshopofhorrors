class BasketItem
  include Mongoid::Document
  belongs_to :product
  embedded_in :basket, inverse_of: :items

  validates :product, presence: true
end
