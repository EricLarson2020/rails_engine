FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    description { Faker::Food.description }
    unit_price { Faker::Number.decimal(l_digits: 2)}
    merchant
  end
end

  # t.string "name"
  # t.string "description"
  # t.integer "unit_price"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.bigint "merchant_id"
  # t.index ["merchant_id"], name: "index_items_on_merchant_id"
