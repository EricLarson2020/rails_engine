
class MerchantsSeed

  def self.seed
    CSV.foreach('./db/data/merchants.csv', headers: true) do |entry|
      Merchant.create ({
        name: entry['name'],
        created_at: entry['created_at'],
        updated_at: entry['updated_at']
      })
    end
  end
end
