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

    if @order.valid?
      
    else
      render :new
    end

   @cratitems = current_member.carts
    @sum = 0
    current_member.carts.each do |cart|
      @sum = cart.quantity * cart.excluded
    end
    @delivery_price = 800
    @total_price = (@delivery_price + @sum) * BigDecimal("1.1").floor 

    #current_member.cart_items_total_amount
    # =>1000
    #current_member.billing_total_amount
    # => 1800  ((cart_items_total_amount +  delivery_price) *tax )
  end

  def create
    @order = Order.new
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
