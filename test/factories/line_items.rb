FactoryGirl.define do
  factory :line_item do
    product { build(:product) }
    quantity 1
  end
end
