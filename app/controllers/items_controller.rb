class ItemsController < ApplicationController
  before_action :authenticate_member!, except: [:top]
	def index
  	@items = Item.page(params[:page]).reverse_order
    @genres = Genre.all
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


