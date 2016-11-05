class Product
  include Mongoid::Document
  include ActiveSupport::NumberHelper

  field :name, type: String
  field :description, type: String
  field :price, type: Integer

  validates :name, :description, :price, presence: true
  validates :price, numericality: {
    only_integer: true,
    greater_than: 0
  }

  def display_price
    number_to_currency price.to_f/100
  end

end
