class Admin::ProductsController < ApplicationController
  before_action :if_not_admin
  
  def new
  end
  def create
  end
  def index
  end
  def show
  end
  def edit
  end
  def update
  end
  
  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
