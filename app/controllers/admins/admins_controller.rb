class Admins::AdminsController < ApplicationController
  def top
    @orders = Order.where(created_at: 1.day.ago.all_day)
  end

end
