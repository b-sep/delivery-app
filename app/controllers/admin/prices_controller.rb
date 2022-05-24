class Admin::PricesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @prices = Price.joins(:hauler).merge(Hauler.active).distinct
    if params[:heigth].present? && params[:depth].present? && params[:width].present? && params[:distance].present?
      @distance = params.require(:distance).to_i
      @cubic_meter = (params[:heigth].to_f * params[:depth].to_f * params[:width].to_f) / 1_000_000
      @weight = params.require(:weight).to_f
      @prices.each do |price|
        if @cubic_meter >= price.min_cubic_meter && @cubic_meter <= price.max_cubic_meter && @weight >= price.min_weight && @weight <= price.max_weight
          @prices = @prices.where("(:cubic_meter >= min_cubic_meter AND :cubic_meter <= max_cubic_meter) AND (:weight >= min_weight AND :weight <= max_weight)", cubic_meter: @cubic_meter, weight: params[:weight])
        end
      end
    end
  end

end