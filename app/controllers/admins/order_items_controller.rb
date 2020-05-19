class Admins::OrderItemsController < ApplicationController

  def update
    @status = Order_items.find([:id])
    if @status.update

  end
end
