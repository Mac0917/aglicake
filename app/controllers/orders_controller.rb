class OrdersController < ApplicationController
  before_action :authenticate_member!, except: [:top]
  #before_action :confirm,only:[:purchase]

  def index
    @orders = Order.all
    @orders = Order.page(params[:page]).per(10)
    @item_total_sum = 0
    @cartitems = current_member.carts
  end

  def show
    @order = Order.find(params[:id])
    @item_sum = 0
    @order.order_items.each do |order_item|
      @item_sum += (order_item.quantity * order_item.item.excluded * 1.1).floor 
    end
  end
  

  def new
    @cartitems = current_member.carts
    unless @cartitems.presence
      redirect_to carts_path
    end
    @order = Order.new
  end

  # 購入確認page
  def purchase
    #if session[:order][:payment_methods] || session[:order][:delivery_select] != nil
    # newのフォームで送れてきた情報を表示したい
    session[:order] = Order.new
      session[:order][:payment_methods] = params[:order][:payment_methods]
    if params[:order][:delivery_select] == "2"
      session[:order][:post_number] = current_member.post_number
      session[:order][:delivery_address] = current_member.address
      session[:order][:delivery_name] = current_member.last_name + current_member.first_name
    elsif params[:order][:delivery_select] == "3"
      address = ShippingAddress.find(params[:order][:register_address])
      session[:order][:delivery_address] = address.delively_address
      session[:order][:post_number] = address.post_number
      session[:order][:delivery_name] = address.delively_name
    elsif params[:order][:delivery_select] == "4"
      session[:order][:delivery_address] = params[:order][:delivery_address]
      session[:order][:post_number] = params[:order][:post_number]
      session[:order][:delivery_name] = params[:order][:delivery_name]
    end
    @cartitems = current_member.carts
    @sum = 0
    current_member.carts.each do |cart|
      @sum += ((cart.quantity * cart.item.excluded) * 1.1).floor
    end
    #binding.pry
    #else
    flash[:empty] = "選択していない欄があります"
    #render :new
    #end
    session[:order][:delivery_price] = 800
    session[:order][:total_price] = 800 + @sum
    session[:order][:status] = 0
    #binding.pry
  end

  def create
    @order = Order.new(session[:order])
		@order.member_id = current_member.id
    @member = current_member
    if @order.save #入力されたデータをdbに保存する。
      flash[:notice] = "注文情報をを登録しました"
      current_member.carts.each do |cart|
        @order_item = OrderItem.new
        @order_item.item_id = cart.item_id
        @order_item.order_id = @order.id
        @order_item.status = 0
        @order_item.quantity = cart.quantity
        @order_item.price = cart.excluded
        @order_item.save
      end
      redirect_to orders_thanks_path, notice: "successfully created order!"#保存された場合の移動先を指定。
      Cart.destroy_all
  	else
  	render 'new'
  	end
  end
  

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:member_id, :delivery_address, :delivery_price, :delivery_name, :payment_methods,:status, :total_price, :created_at, :updated_at, :post_number)
  end

  #def confirm
    #if params[:order][:payment_method] || params[:order][:deliver_select] == nil
    #redirect_to new_order_path
  #end
  #end

end
