FactoryGirl.define do
  factory :basket do
    products { [build(:product), build(:product)] }
  end
end
