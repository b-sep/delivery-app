class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @haulers = Hauler.active
  end
end