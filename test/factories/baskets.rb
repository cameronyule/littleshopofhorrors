FactoryGirl.define do
  factory :basket do
    factory :basket_with_products do
      products { [build(:product), build(:product)] }
    end
  end
end
