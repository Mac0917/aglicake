class OrdersController < ApplicationController

  def index
    @orders = Oreders.all.order(created_at: :desc)
  end

  def show
    @order = member_id.Orders.find(params[:id])
    @status = Order.new
  end

  def update
    @status  = Order.new(params[:id])
    @status.save
    redirect_to admin_orders
  end
end
