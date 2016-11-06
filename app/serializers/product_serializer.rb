class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :display_price
end
