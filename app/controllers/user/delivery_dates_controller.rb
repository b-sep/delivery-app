class User::DeliveryDatesController < ApplicationController
  before_action :get_hauler, only: %i[index new create]
  before_action :authenticate_user!
  def index
    @delivery_dates = DeliveryDate.all
  end

  def new
    @delivery_date = @hauler.delivery_dates.new
  end

  def create
    @delivery_date = @hauler.delivery_dates.new(delivery_date_params)
    if @delivery_date.save
      redirect_to user_hauler_delivery_dates_path(@hauler), notice: 'Prazo cadastrado com sucesso!'
    else
      flash.now[:alert] = 'Erro ao salvar prazo'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def get_hauler
    @hauler = Hauler.find(params[:hauler_id])
  end

  def delivery_date_params
    params.require(:delivery_date).permit(:distance_1, :distance_2, :days)
  end
end