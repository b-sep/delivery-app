class HomeController < ApplicationController
  def index
    if params[:search].present?
      @order = Order.find_by(code: params[:search])
    end
    
    if !@order.nil?
      @order_historics = @order.order_historics
    end
  end
end