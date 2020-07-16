FactoryBot.define do
  factory :transaction do
    sequence(:id) {|n| n }
    credit_card_number { Faker::Number.number(digits: 16) }
    credit_card_expiration_date { '' }
     result { ["success", "failed"].sample }
  end
end
