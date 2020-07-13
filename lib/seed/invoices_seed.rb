

class InvoicesSeed

  def self.seed
    parsed_customers = CSV.foreach('./db/data/invoices.csv', headers: true) do |entry|
      Invoice.create({
        customer_id: entry['customer_id'],
        merchant_id: entry['merchant_id'],
        status: entry['status'],
        created_at: entry['created_at'],
        updated_at: entry['updated_at']
        })
    end
  end
end
