class ShopperSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :basket

  def id
    object.id.to_s
  end
end
