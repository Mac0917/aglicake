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

  # 購入確認page
  def purchase
    # newのフォームで送れてきた情報を表示したい
    @order = Order.new(order_params)
    @cratitems = current_member.carts
    @sum = 0
    current_member.carts.each do |cart|
      @sum = cart.quantity * cart.excluded
    end
    @delivery_price = 800
    @total_price = (@delivery_price + @sum) * BigDecimal("1.1").floor 
  end

  def create
    @order = Order.new(order_params) 
		@order.member_id = current_member.id
    @member = current_member
    if @order.save #入力されたデータをdbに保存する。
      flash[:notice] = "注文情報をを登録しました"
  		redirect_to orders_thanks_path, notice: "successfully created order!"#保存された場合の移動先を指定。
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

end
