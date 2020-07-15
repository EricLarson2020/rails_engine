class Api::V1::Merchant::FindController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.find_one(params[:name], params[:created_at], params[:updated_at]))
  end

  def index
    render json: MerchantSerializer.new(Merchant.find_all(params[:name], params[:created_at], params[:updated_at]))
  end



end
