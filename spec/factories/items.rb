FactoryBot.define do
  factory :item do
    sequence(:id) {|n| n }
     sequence(:name) {|n| "Item name #{n}" }
     sequence(:description) {|n| "Item description #{n}" }
     sequence(:unit_price) {|n| n + 0.95 }
  end
end

  # t.string "name"
  # t.string "description"
  # t.integer "unit_price"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.bigint "merchant_id"
  # t.index ["merchant_id"], name: "index_items_on_merchant_id"
