FactoryBot.define do
  factory :customer do
    sequence(:first_name) { |n| "Name #{n}"}
    sequence(:last_name) { |n| "Name #{n}"}
  end
end
