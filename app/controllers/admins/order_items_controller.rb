class Admins::OrderItemsController < ApplicationController
  
  def update
    @status = Order_items.find([:id])
    @status.update

  end
end