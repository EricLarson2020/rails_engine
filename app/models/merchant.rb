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

      Merchant.select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(invoices: [:invoice_items, :transactions])
      .where(transactions: {result: "success"})
      .group(:id)
      .order("SUM(invoice_items.quantity * invoice_items.unit_price) DESC")
      .limit(params)

    end

    def self.most_items(params)

      answer = Merchant.select("merchants.*, SUM(invoice_items.quantity) as items_sold")
        .joins(invoices: [:invoice_items, :transactions])
        .where(transactions: {result: "success"})
        .group(:id)
        .order("SUM(invoice_items.quantity) DESC")
        .limit(params)
    end

    def self.revenue_between_dates(start_date, end_date)

    starting_date = Date.parse(start_date).beginning_of_day
    ending_date = Date.parse(end_date).end_of_day

   total_rev = Invoice.select("SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
                      .joins(:invoice_items, :transactions)
                      .where(transactions: {result: 'success'})
                      .where('date(invoices.created_at) BETWEEN ? AND ?', starting_date, ending_date)

    end




   # answer =   InvoiceItem.select("SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
   # .joins(invoices: [:transactions])
   # .where(transactions: {result: 'success'})
   # .where('invoices.created_at BETWEEN ? AND ?', "#{params[:start].to_date.beginning_of_day}", "#{params[:end].to_date.end_of_day}")
   # binding.pry


    scope :given_name, ->(name) {where( 'name ILIKE ?', "%" + "#{name}" + "%") if name}

    scope :given_created_at, ->(created_at) {where("to_char(created_at, 'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%" + "#{created_at}" + "%") if created_at}

    scope :given_updated_at, ->(updated_at) {where("to_char(created_at, 'yyyy-mon-dd-HH-MI-SS') ILIKE ?", "%" + "#{updated_at}" + "%") if updated_at}

end
