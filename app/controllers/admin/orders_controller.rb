class Admin::OrdersController < ApplicationController
  def index
    @haulers = Hauler.active
  end
end