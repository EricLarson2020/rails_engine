FactoryBot.define do
  factory :invoice_items do
    quantity { Faker::Number.between(from: 1, to: 5) }
   unit_price { Faker::Number.decimal(l_digits: 2) }
   invoice
   item
  end
end
