class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
    has_many :invoices, dependent: :destroy




    def self.find_one(name = nil, created_at = nil, updated_at = nil)

      find_all(name, created_at, updated_at).first

    end


    def self.find_all(name = nil, created_at = nil, updated_at = nil)
        combined_values = []
        combined_values << given_name(name) if name
        combined_values << given_created_at(created_at) if created_at
        combined_values << given_updated_at(updated_at) if updated_at
        combined_values.flatten.uniq
    end

    def self.most_revenue(params)

      answer = Merchant.select("merchants.name, SUM(invoice_items.quantity * invoice_items.unit_price) AS total")
      .joins(invoices: [:invoice_items, :transactions])
      .where(transactions: {result: "success"})
      .group('merchants.name')
      .order("SUM(invoice_items.quantity * invoice_items.unit_price) DESC")
      .limit(params)
    

    end

    scope :given_name, ->(name) {where( 'name ILIKE ?', "%" + "#{name}" + "%") if name}

    scope :given_created_at, ->(created_at) {where("to_char(created_at, 'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%" + "#{created_at}" + "%") if created_at}

    scope :given_updated_at, ->(updated_at) {where("to_char(created_at, 'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%" + "#{updated_at}" + "%") if updated_at}

end
