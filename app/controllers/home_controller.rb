class HomeController < ApplicationController
  before_action :get_order, only: %i[index]

  def index
    if @order.present?
      @order_historics = @order.order_historics
      @vehicle = Vehicle.find(@order.vehicle_id)
    end   
  end

  private

  def get_order
    @order = Order.find_by(code: params[:search]) if params[:search].present?
  end
  
end