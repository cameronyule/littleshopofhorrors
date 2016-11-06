FactoryGirl.define do
  factory :shopper do
    name "MyString"
    email "MyString"

    after(:build) do |shopper|
       shopper.basket = build(:basket, shopper: shopper)
    end
    after(:create) do |shopper|
       shopper.basket = create(:basket, shopper: shopper)
    end

    factory :shopper_with_items do
      after(:build) do |shopper|
         shopper.basket = build(:basket_with_items, shopper: shopper)
      end
      after(:create) do |shopper|
         shopper.basket = create(:basket_with_items, shopper: shopper)
      end
    end
  end
end
