class Merchant < ApplicationRecord
  has_many :items

  # attr_reader :name,
  #             :id
  #
  # def initialize(data)
  #   @name = data[:attributes][:name]
  #   @id = data[:id]
  # end

  



    #  def self.find_one(params)
    #    attributes = Merchant.first.attributes
    #    search_words = params.permit(attributes.keys).to_h
    #    answer = search_words.map do |k,v|
    #       Merchant.where("lower(#{k}) LIKE '%#{v.downcase}%'")
    #    end
    #  end
    #
    # def self.find_all(params)
    #
    # end
end
