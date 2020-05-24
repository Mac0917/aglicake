class ItemsController < ApplicationController
  
  def index
    if member_signed_in? 
        @items = Item.page(params[:page]).reverse_order
        @genres = Genre.all
        @member = Member.find(current_member.id)
        if @member.status == "無効会員"
            reset_session
            flash[:notice] = "このメールアドレスは使用できません"
            redirect_to root_path
        end
    else
        @items = Item.page(params[:page]).reverse_order
        @genres = Genre.all
    end
  end

  def show
      @item = Item.find(params[:id])
      @genre = @item.genre
      @cart = Cart.new
  end



private
    def item_params

      params.require(:item).permit(:name, :explanation, :status, :excluded, :genre_id)
  end
    
end
