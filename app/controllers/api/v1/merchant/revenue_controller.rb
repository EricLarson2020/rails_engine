class Api::V1::Merchant::RevenueController < ApplicationController

  def index

    render json: RevenueSerializer.new(Merchant.revenue_between_dates(params[:start], params[:end]))
  end

end
