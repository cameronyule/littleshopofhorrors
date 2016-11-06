FactoryGirl.define do
  factory :shopper do
    name "MyString"
    email "MyString"
    basket { build(:basket) }
  end
end
