class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :display_price

  def id
    object.id.to_s
  end
end
