class User::HaulersController < ApplicationController
  before_action :authenticate_user!

  def show
    @hauler = current_user.hauler
  end
end