class Admins::OrdersController < ApplicationController

  def index
    @orders = Order.all.order(created_at: :desc)
    @orders = Order.page(params[:page]).per(10)
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:status]
    @order.save
    redirect_to admins_orders_path
  end
end
