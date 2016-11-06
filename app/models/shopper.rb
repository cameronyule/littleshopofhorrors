class Shopper
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  embeds_one :basket

  after_initialize :init_basket

  def init_basket
    self.basket ||= Basket.new if self.new_record?
  end
end
