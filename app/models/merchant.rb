class Merchant < ApplicationRecord
  has_many :items

  # attr_reader :name,
  #             :id
  #
  # def initialize(data)
  #   @name = data[:attributes][:name]
  #   @id = data[:id]
  # end
end
