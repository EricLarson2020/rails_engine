class Api::V1::Items::FindController < ApplicationController

  def show

    render json: ItemSerializer.new(Item.find_one(params[:name], params[:created_at], params[:updated_at], params[:description], params[:unit_price], params[:merchant_id]))
  end

  def index
    render json: ItemSerializer.new(Item.find_all(params[:name], params[:created_at], params[:updated_at], params[:description], params[:unit_price], params[:merchant_id]))
  end


end
