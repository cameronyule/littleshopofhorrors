FactoryGirl.define do
  factory :basket do
    factory :basket_with_items do
      items { [build(:basket_item), build(:basket_item)] }
    end
  end
end
