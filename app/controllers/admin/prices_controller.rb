class Admin::PricesController < ApplicationController
  before_action :authenticate_admin!
  before_action :cubic_meter, only: %i[index]
  before_action :prices_from_active_haulers, only: %i[index]

  def index
    if have_params?
      @distance = params.require(:distance).to_i
      @weight = params.require(:weight).to_f

      @prices.each do |price|
        if @cubic_meter >= price.min_cubic_meter && @cubic_meter <= price.max_cubic_meter && @weight >= price.min_weight && @weight <= price.max_weight
          @prices = @prices.where("(:cubic_meter >= min_cubic_meter AND :cubic_meter <= max_cubic_meter) AND (:weight >= min_weight AND :weight <= max_weight)", cubic_meter: @cubic_meter, weight: params[:weight])
        end
      end
    end
  end

  private

  def have_params?
    return true if params[:heigth].present? && params[:depth].present? && params[:width].present? && params[:distance].present? && params[:weight].present?
  end

  def cubic_meter
    @cubic_meter = (params[:heigth].to_f * params[:depth].to_f * params[:width].to_f) / 1_000_000
  end

  def prices_from_active_haulers
    @prices = Price.joins(:hauler).merge(Hauler.active)
  end
end