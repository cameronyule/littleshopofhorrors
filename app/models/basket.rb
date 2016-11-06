class Basket
  include Mongoid::Document
  embedded_in :shopper
  has_and_belongs_to_many :products, inverse_of: nil
end
