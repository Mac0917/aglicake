class Admins::OrdersController < ApplicationController

  def index
    @orders = Order.all.order(created_at: :desc).limit(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @status = Order.find(prams[:id])
    @status.update
    redirect_to admin_orders
  end

end
