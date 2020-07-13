

class InvoiceItemsSeed
  def self.seed
    number = 0
    parsed_customers = CSV.foreach('./db/data/invoice_items.csv', headers: true) do |entry|

      number += 1
      InvoiceItem.create ({
        item_id: entry['item_id'],
        invoice_id: entry['invoice_id'],
        quantity: entry['quantity'],
        unit_price: entry['unit_price'],
        created_at: entry['created_at'],
        updated_at: entry['updated_at']
        })
      puts "Created InvoiceItems joins table #{number} / 21688"


    end
  end
end
