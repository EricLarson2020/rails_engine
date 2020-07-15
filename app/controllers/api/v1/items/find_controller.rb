class Api::V1::Items::FindController < ApplicationController

  def show
    binding.pry
    render json: ItemSerializer.new(Item.find_one(params[:name], params[:created_at], params[:updated_at]))
  end

end
