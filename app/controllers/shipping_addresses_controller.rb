class ShippingAddressesController < ApplicationController

    before_action :authenticate_member!

    def index
        @shipping = ShippingAddress.new
        @member = Member.find(current_member.id)
    end

    def create
        @shipping = ShippingAddress.new(shipping_address_params)
        @shipping.member_id = current_member.id
        if @shipping.save
            flash[:notice] = "配送先情報を登録しました"
            redirect_to  shipping_addresses_path
        else
            @member = Member.find(current_member.id)
            render "index"
        end
    end

    def edit
        @shipping = ShippingAddress.find(params[:id])
    end

    def update
        @shipping = ShippingAddress.find(params[:id])
        if  @shipping.update(shipping_address_params)
            flash[:notice] = "配送先情報を更新しました"
            redirect_to  shipping_addresses_path
        else
            render "edit"
        end
    end

    def destroy
        @shipping = ShippingAddress.find(params[:id])
        @shipping.destroy
        flash[:notice] = "配送先情報を削除しました"
        redirect_to  shipping_addresses_path
    end
    
    private

    def shipping_address_params
		params.require(:shipping_address).permit(:post_number, :delively_address, :delively_name)
	end
end
