class BasketSerializer < ActiveModel::Serializer
  attributes :id, :products

  def id
    object.id.to_s
  end

end
