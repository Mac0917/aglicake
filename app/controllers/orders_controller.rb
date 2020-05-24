class OrdersController < ApplicationController
  before_action :authenticate_member!, except: [:top]
  def index
  @orders = Order.all
  @oreder = current_order
  end

  def show
  @order = Order.find(current_member.id)
  @orders = current_member.cart
  end

  def new
  @order = Order.new
  end

  def create
    @order = Order.new(order_params) 
		@order.member_id = current_member.id
		@member = current_member
  	if @order.save #入力されたデータをdbに保存する。
  		redirect_to order_path(@order.id), notice: "successfully created order!"#保存された場合の移動先を指定。
  	else
  		@orders = Order.all
  		render 'index'
  	end
  end

  def thanks
  end

  def purchase
  end



  private
  def order_params
    params.require(:order).permit(:member_id, :delivery_address, :delivery_price, :delivery_name, :payment_methods,:status, :total_price, :created_at, :updated_at)
  end

end
