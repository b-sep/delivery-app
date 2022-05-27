class User::OrdersController < ApplicationController
  before_action :get_hauler, only: %i[show update]
  before_action :get_order, only: %i[show update]
  before_action :get_vehicle, only: %i[update]

  def show
    @vehicles = @hauler.vehicles
  end

  def update
    @order.vehicle_id = @vehicle.id
    if @order.save
      @order.accepted!
      redirect_to user_hauler_path(@hauler), notice: 'Ordem de serviço aceita com sucesso'
    else
      flash.now[:alert] = 'Informe um veículo'
      render :show, status: :unprocessable_entity
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