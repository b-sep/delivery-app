class HaulersController < ApplicationController

  def index; end
  
  def new
    @hauler = Hauler.new
  end

  def create
    @hauler = Hauler.new(hauler_params)
    
    if @hauler.save
      redirect_to haulers_path, notice: 'Transportadora cadastrada com sucesso'
    else
      flash.now[:notice] = 'Erro ao cadastrar transportadora'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def hauler_params
    params.require(:hauler).permit(:brand_name, :corporate_name, :registration_number, :address, :email_domain)
  end
end