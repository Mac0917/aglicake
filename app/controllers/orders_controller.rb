class OrdersController < ApplicationController
  before_action :authenticate_member!, except: [:top]
  def index
  @orders = Order.all
  @oreder = current_order
  end

  # def show
  # @order = Order.find(current_member.id.)
  # @orders = current_member.cart
  # end

  def new
  @order = Order.new
  end

  def create
    @order = Order.new
		@order.member_id = current_member.id
    @member = current_member
    
    # if params[:delivery_select] == 2
    #   @order.payment_methods = 
    #   @order.delivery_address = current_member.address
    #   @order.delivery_name = 
    # elsif params[:delivery_select] == 3
    #   @order.payment_methods =
    #   @order.delivery_address = 
    #   @order.delivery_name = 
    # else params[:delivery_select] == 4
    #   @order.payment_methods = 
    #   @order.delivery_address = params[:delivery_address]
    #   @order.delivery_name = params[:delivery_name]
    # end
  	# if @order.save #入力されたデータをdbに保存する。
  	  redirect_to order_purchase_path, notice: "successfully created order!"#保存された場合の移動先を指定。
  	# # else
  	# 	@orders = Order.all
  	# 	render 'index'
  	# end
  end

  def thanks
  end

  def purchase
    @order = Order.new(order_params)
    @orders = current_member.cart
  end


  private
  def order_params
    params.require(:order).permit(:member_id, :delivery_address, :delivery_price, :delivery_name, :payment_methods,:status, :total_price, :created_at, :updated_at)
  end

end
