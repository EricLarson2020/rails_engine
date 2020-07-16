FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Number.number(digits: 16) }
    sequence(:credit_card_expiration_date) {|n| n }
    result { ["success", "failed"].sample }
    invoice
  end
end
