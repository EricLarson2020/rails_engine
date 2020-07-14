class Api::V1::Merchant::FindController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.find_one(params))
  end



end
