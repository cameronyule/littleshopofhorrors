FactoryGirl.define do
  factory :basket_item do
    after(:build) do |item|
       item.product = build(:product)
    end
    after(:create) do |item|
       item.product = create(:product)
    end
  end
end
