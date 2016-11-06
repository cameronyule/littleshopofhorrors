FactoryGirl.define do
  factory :basket_item do
    product { create(:product) }
  end
end
