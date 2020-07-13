


class ItemsSeed



  def self.seed
    number = 0
    parsed_customers = CSV.foreach('./db/data/items.csv', headers: true) do |entry|
      number += 1

      price = (entry['unit_price']).to_s.insert(-3, '.').to_f
  
      new_item = Item.create({
        name: entry['name'],
        description: entry['description'],
        unit_price: price,
        merchant_id: entry['merchant_id'],
        created_at: entry['created_at'],
        updated_at: entry['updated_at']
        })

        puts "Seeding Item table #{number}"

    end
  end



end
