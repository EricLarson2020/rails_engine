require 'csv'
require '/Users/ericlarson/turing/3module/rails_driver/app/models/customer.rb'


class CustomersSeed

  def self.seed
    parsed_customers = CSV.foreach('./db/data/customers.csv', headers: true) do |entry|

      Customer.create ({
        first_name: entry['first_name'],
        last_name: entry['last_name'],
        created_at: entry['created_at'],
        updated_at: entry['updated_at']
      })
    # Customer.new(data)
    # Customer.save
     end
  end
end
