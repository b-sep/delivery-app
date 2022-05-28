class User::PricesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hauler, only: %i[index new create]
  def index
    @prices = @hauler.prices
  end

  def new
    @price = @hauler.prices.new
  end

  def create
    @price = @hauler.prices.new(price_params)
    if @price.save
      redirect_to user_hauler_prices_path(@hauler), notice: 'Preço cadastrado com sucesso!'
    else
      flash.now[:alert] = 'Erro ao cadastrar preço'
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def set_hauler
    @hauler = Hauler.find(params[:hauler_id])
  end

  def price_params
    params.require(:price).permit(:min_cubic_meter, :max_cubic_meter, :min_weight, :max_weight, :km_price)
  end
end