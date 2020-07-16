FactoryBot.define do
  factory :invoice_item do
    sequence(:quantity) {|n| n }
    sequence(:unit_price) {|n| n + 0.50 }

  end
end
