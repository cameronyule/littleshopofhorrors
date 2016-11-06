FactoryGirl.define do
  factory :order do
    factory :order_with_line_items do
      line_items { [build(:line_item), build(:line_item)] }
    end
  end
end
