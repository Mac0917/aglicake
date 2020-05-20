class Admins::OrdersController < ApplicationController

  def index
    @orders = Order.all.order(created_at: :desc).limit(10)
  end

  def show
    @order = Order.find(params[:id])
    
  end

  def update
    @order = Order.find(params[:id])
    # Orderから１件
    @order.status = params[:status]
    @order.save
    redirect_to admins_orders_path
  end

end
