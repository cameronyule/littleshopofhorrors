class ShopperSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_one :basket
end
