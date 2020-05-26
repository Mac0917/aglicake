class CartsController < ApplicationController

    before_action :authenticate_member!

    def index
        @carts = Cart.where(member_id: current_member.id)
    end
    def create
        @cart = current_member.carts.new(cart_params)
        cart_item = current_member.carts.find_by(item_id: params[:cart][:item_id])
        if cart_item
            cart_item.quantity += params[:cart][:quantity].to_i
            cart_item.save!
        else
            @cart = current_member.carts.new(cart_params)
             @cart.save!
             flash[:success] = 'カートに商品を追加しました'
         end

                redirect_back(fallback_location: root_path)
    end

    def update
        @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
        redirect_back(fallback_location: root_path)
    else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
        redirect_back(fallback_location: root_path)
    end
    end


    def destroy
            #cart = current_member.carts.find_by(params[:item_id])
            cart = Cart.find(params[:id])
            cart.destroy
            redirect_back(fallback_location: root_path)
    end

    def destroy_all
                #cart = current_member.carts.find_by(params[:item_id])
                cart = Cart.where(member_id: current_member.id)
                cart.destroy_all
                redirect_back(fallback_location: root_path)

    end

    private
        def cart_params
            params.require(:cart).permit(:item_id, :quantity)
        end
end

