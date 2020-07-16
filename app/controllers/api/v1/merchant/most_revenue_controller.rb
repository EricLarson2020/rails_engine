class Api::V1::Merchant::MostRevenueController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.most_revenue(params[:quantity]))
  end

end
