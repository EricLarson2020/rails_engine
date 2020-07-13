class Api::V1::ItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    binding.pry
    render json: ItemSerializer.new(Item.find(params['id']))
  end

  def create
    render json: ItemSerializer.new(Item.create(item_params))
  end

  def update
    render json: ItemSerializer.new(Item.update(params[:id], item_params))
  end

  def destroy
    item = Item.find(params['id'])
    render json: ItemSerializer.new(item)
    Item.delete(item)
  end
  private

  def item_params
    params.require(:item).permit(:name, :description, :merchant_id)
  end
end
