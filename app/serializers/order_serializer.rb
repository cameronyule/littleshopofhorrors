class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total
  has_many :line_items
end
