class User::HaulersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @hauler = current_user.hauler
    @orders = @hauler.orders
  end
end