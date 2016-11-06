class Shopper
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  embeds_one :basket
end
