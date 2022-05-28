class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.all
  end
  
  def create
    @hauler = Hauler.find(params[:hauler])
    @order = @hauler.orders.new(order_params)
    if @order.save
      redirect_to [:admin, @order], notice: 'Ordem registrada com sucesso'
    else
      flash.now[:alert] = "Erro ao salvar ordem"
      redirect_to admin_prices_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  
  def order_params
    params.permit(:heigth, :depth, :width, :distance, :weight, :price, :days, :user, :address)
  end
  
end