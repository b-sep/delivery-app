class User::VehiclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hauler, only: %i[index new create]
  before_action :set_vehicle, only: %i[show]

  def index
    @vehicles = @hauler.vehicles
  end

  def show; end

  def new
    @vehicle = @hauler.vehicles.new
  end

  def create
    @vehicle = @hauler.vehicles.new(vehicle_params)

    if @vehicle.save
      redirect_to [:user, @hauler, @vehicle], notice: 'Veículo cadastrado com sucesso!'
    else
      flash.now[:alert] = 'Erro ao salvar veículo'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_hauler
    @hauler = Hauler.find(params[:hauler_id])
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:license_plate, :full_load, :car_model, :year, :vehicle_brand)
  end
end