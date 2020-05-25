class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all.order(created_at: :desc)
    @orders = Order.page(params[:page]).per(10)
    @item_total_sum = 0
  end
  
  def show
    @order = Order.find(params[:id])
    @item_total_sum = 0
    @order.order_items.each do |order_item|
      @item_sum = order_item.quantity * order_item.price.to_i
    
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:status]
    @order.save
    redirect_to admins_orders_path
  end
end
