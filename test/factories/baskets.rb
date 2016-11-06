FactoryGirl.define do
  factory :basket do
    factory :basket_with_items do
      after(:build) do |basket|
         basket.items = [
           build(:basket_item, basket: basket),
           build(:basket_item, basket: basket)
         ]
      end
      after(:create) do |basket|
        basket.items = [
          create(:basket_item, basket: basket),
          create(:basket_item, basket: basket)
        ]
      end
    end
  end
end
