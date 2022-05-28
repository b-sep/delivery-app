class User::OrdersController < ApplicationController
  before_action :get_hauler, only: %i[show update]
  before_action :get_order, only: %i[show update]
  before_action :get_vehicle, only: %i[update]
  
  def show
    @order_historics = @order.order_historics
    @vehicles = @hauler.vehicles
  end

  def update
    @order.vehicle_id = @vehicle.id
    if params[:refuse].present?
      @order.recused!
      redirect_to user_hauler_order_path(@hauler, @order), alert: 'Ordem de serviço recusada'
    elsif params[:accept].present?
      if @order.save
        @order.accepted!
        redirect_to user_hauler_order_path(@hauler, @order), notice: 'Ordem de serviço aceita com sucesso'
      end
    end
  end

  private 

  def get_hauler
    @hauler = current_user.hauler
  end

  def get_vehicle
    @vehicle = Vehicle.find(params[:vehicle])
  end

  def get_order
    @order = Order.find(params[:id])
  end

end