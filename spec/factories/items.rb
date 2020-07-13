FactoryBot.define do
  factory :item do
    name { Faker::Food.dish }
    description { Faker::Food.description }

  end
end

  # t.string "name"
  # t.string "description"
  # t.integer "unit_price"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.bigint "merchant_id"
  # t.index ["merchant_id"], name: "index_items_on_merchant_id"
