class Api::V1::Items::FindController < ApplicationController

  def show
    render json: ItemSerializer.new(Item.find_one(params[:name], params[:created_at], params[:updated_at]), params[:description], params[:unit_price])
  end

  def index
    render json: ItemSerializer.new(Item.find_one(params[:name], params[:created_at], params[:updated_at]), params[:description], params[:unit_price])
  end


end
