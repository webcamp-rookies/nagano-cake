class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!


  def index
    @orders = Order.all.page(params[:page]).per(10).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to admin_order_path(order.id)
      flash[:notice] = "注文情報を更新しました"
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
