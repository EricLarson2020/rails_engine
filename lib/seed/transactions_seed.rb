class TransactionsSeed

  def self.seed
    number = 0
    CSV.foreach('./db/data/transactions.csv', headers: true) do |entry|
      number += 1
      Transaction.create({
        invoice_id: entry['invoice_id'],
        credit_card_number: entry['credit_card_number'],
        credit_card_expiration_date: entry['credit_card_expiration_date'],
        result: entry["result"],
        created_at: entry['created_at'],
        updated_at: entry['updated_at']
        })

        puts "created Transaction joins table #{number} / 5968"
      end
    end
  end
