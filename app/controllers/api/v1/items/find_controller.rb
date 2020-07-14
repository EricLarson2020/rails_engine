class Api::V1::Items::FindController < ApplicationController

  def show

    render json: ItemSerializer.new(Item.find_one(params))
  end

end
