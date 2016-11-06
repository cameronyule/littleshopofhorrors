FactoryGirl.define do
  factory :basket do
    factory :basket_with_products do
      products { [create(:product), create(:product)] }
    end
  end
end
