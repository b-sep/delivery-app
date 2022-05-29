class User::OrderHistoricsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_hauler, only: %i[new create]
  before_action :get_order, only: %i[new create]

  def new
    @order_historic = OrderHistoric.new
  end

  def create
    @order_historic = @order.order_historics.new(order_historic_params)
    if @order_historic.save
      redirect_to user_hauler_order_path(@hauler, @order), notice: 'Rota atualizada'
    end
  end


  private

  def get_hauler
    @hauler = Hauler.find(params[:hauler_id])
  end

  def get_order
    @order = Order.find(params[:order_id])
  end

  def order_historic_params
    params.require(:order_historic).permit(:address)
  end

end