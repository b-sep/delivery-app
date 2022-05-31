class Admin::HaulersController < ApplicationController 
  before_action :authenticate_admin!
  before_action :get_hauler, only: %i[show update]

  def index
    @haulers = Hauler.all
    @prices = Price.all
  end

  def new
    @hauler = Hauler.new
  end

  def create
    @hauler = Hauler.new(hauler_params)
    
    if @hauler.save
      redirect_to admin_hauler_path(@hauler), notice: 'Transportadora cadastrada com sucesso'
    else
      flash.now[:alert] = 'Erro ao cadastrar transportadora'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def update
    @hauler.status = params[:hauler][:status]

    if @hauler.save
      redirect_to admin_hauler_path(@hauler), notice: 'Status atualizado'
    end
  end

  private

  def hauler_params
    params.require(:hauler).permit(:brand_name, :corporate_name, :registration_number, :address, :email_domain)
  end

  def get_hauler
    @hauler = Hauler.find(params[:id])
  end
end