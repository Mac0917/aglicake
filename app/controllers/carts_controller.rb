class CartsController < ApplicationController



	def index
    @carts = Cart.where(member_id: current_member.id)
    
	end
	def create
         @cart = current_member.carts.new(cart_params)
         curt_item = current_member.carts.find_by(item_id: params[:cart][:item_id])
         if curt_item
             
             

                 curt_item.quantity += params[:cart][:quantity].to_i
                 
                 curt_item.save!
                 
           
        else
            @cart = current_member.carts.new(cart_params)
             @cart.save!
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
            item = Item.find(params[:item_id])
            cart = current_member.carts.find_by(item_id: item.id)
            cart.destroy
            redirect_back(fallback_location: root_path)
    end

        private
          def cart_params
            params.require(:cart).permit(:item_id, :quantity)
          end


end
