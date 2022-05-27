class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
end