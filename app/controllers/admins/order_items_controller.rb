class Admins::OrderItemsController < ApplicationController
  
  def update
    @order_item = Order_items.find([:id])
    @order_item.status = params(:status)
    @status.update
    redirect_to admins_order_items_edit_path
  end
end

