class Admins::OrderItemsController < ApplicationController
  
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.status = params[:status]
    @order_item.save
    redirect_to request.referer
  end

end
