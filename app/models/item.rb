class Item < ApplicationRecord
  belongs_to :merchant

   has_many :invoice_items
   has_many :invoices, through: :invoice_items


   has_many :order_items
   has_many :orders, through: :order_items


   def self.find_one(params)
     binding.pry
   end

  def self.find_all(params)

  end


end
