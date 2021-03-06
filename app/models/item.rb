class Item < ApplicationRecord
  belongs_to :merchant

   has_many :invoice_items
   has_many :invoices, through: :invoice_items


   has_many :order_items
   has_many :orders, through: :order_items


   def self.find_one(name = nil, created_at = nil, updated_at = nil, description = nil, unit_price = nil, merchant_id = nil)

    find_all(name, created_at, updated_at, description, unit_price, merchant_id).first

   end

  def self.find_all(name = nil, created_at = nil, updated_at = nil, description = nil, unit_price = nil, merchant_id = nil)

    combined_values = []
    combined_values << given_name(name) if name
    combined_values << given_description(description) if description
    combined_values << given_unit_price(unit_price) if unit_price
    combined_values << given_created_at(created_at) if created_at
    combined_values << given_updated_at(updated_at) if updated_at
    combined_values.flatten.uniq

  end


  scope :given_name, ->(name) {where( 'name ILIKE ?', "%" + "#{name}" + "%") if name}

  scope :given_created_at, ->(created_at) {where("to_char(created_at, 'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%" + "#{created_at}" + "%") if created_at}

  scope :given_updated_at, ->(updated_at) {where("to_char(created_at, 'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%" + "#{updated_at}" + "%") if updated_at}

  scope :given_description, ->(description) {where( 'description ILIKE ?', "%" + "#{description}" + "%") if description}

  scope :given_unit_price, ->(unit_price) {where("to_char(unit_price, '99999.99')  ILIKE ?", "%" + "#{unit_price}" + "%") if unit_price}

  scope :merchant_id, ->(merchant_id) {where("to_char(merchant_id, '99999') ILIKE ?", "%" + "#{merchant_id}" + "%") if merchant_id}


end
