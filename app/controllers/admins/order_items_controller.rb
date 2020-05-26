class Admins::OrderItemsController < ApplicationController
  
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.status = params[:order_item][:status]
    # binding.pry
    @order_item.save!
    redirect_to request.referer
  end

end
