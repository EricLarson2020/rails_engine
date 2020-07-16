FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    sequence(:description) { |n| "Food #{n}"}
    sequence(:unit_price) {|n| n + 0.50 }

  end
end

  # t.string "name"
  # t.string "description"
  # t.integer "unit_price"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.bigint "merchant_id"
  # t.index ["merchant_id"], name: "index_items_on_merchant_id"
