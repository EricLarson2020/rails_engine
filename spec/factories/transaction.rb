FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Number.number(digits: 16) }

    result { ["success", "failed"].sample }

  end
end
