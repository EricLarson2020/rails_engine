# require 'csv'
 require 'pry'
require './lib/seed/customers_seed.rb'
require './lib/seed/merchants_seed.rb'
require './lib/seed/invoices_seed.rb'
require './lib/seed/items_seed.rb'
require './lib/seed/invoice_items_seed.rb'
require './lib/seed/transactions_seed.rb'





# Dir.each_child('/Users/ericlarson/turing/3module/rails_driver/db/data') do |filename|

 # customers = CSV.read('./db/data/customers.csv')
 # customers.each do |entry|
 #   entry.each do |data|
 #     t = Customer.new


# customers.map { |a| Hash[keys.zip(a)]}
  # parsed_customers = CSV.foreach('./db/data/customers.csv', headers: true) do |entry|
  #   data = {
  #     first_name: entry['first_name'],
  #     last_name: entry['last_name'],
  #     created_at: entry['created_at'],
  #     updated_at: entry['updated_at']
  #   }
  # Customer.new(data)
  # Customer.save
  #
  #
  # end

# parsed_customers = CSV.parse(customers, :headers => true)
# parsed_customers.each do |row|
#   Moulding.create!(row.to_hash)
# end

# parsed_customers.each do |row|
#   t = Customer.new
#   t.first_name = row[:first_name]
#   t.last_name = row[:last_name]
#   t.created_at = row[:created_at]
#   t.updated_at = row[:updated_at]
# end


  # task :do_it => :environment do
  #   puts "Something useful"
  # end




desc "Reset and seed the database from existing CSV files"
  task process_csv: 'db:reset' do
    CustomersSeed.seed
    MerchantsSeed.seed
    ItemsSeed.seed
    InvoicesSeed.seed
    InvoiceItemsSeed.seed
    TransactionsSeed.seed
    end


    # Rake::Task['tmp:some_task'].invoke
      # Dir.foreach('/db/data') do |filename|
