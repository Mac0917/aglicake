class ItemsController < ApplicationController

  def index
      @items = Item.page(params[:page]).reverse_order
      @genres = Genre.where(status: "有効")
      if params[:genre_id].nil?
        @genre = Genre.new
        @genre.name = "商品"
        @items = Item.page(params[:page]).reverse_order
      else
        @genre = Genre.find(params[:genre_id])
        @items = Item.where(genre_id: @genre.id).page(params[:page]).reverse_order
      end
  end

  def show
      @item = Item.find(params[:id])
      @genre = @item.genre
      @genres = Genre.where(status: "有効")
      @cart = Cart.new
  end

  def search
    if params[:name].present?
      @items = Item.where('name LIKE ?', "%#{params[:name]}%")
    else
      @items = Item.none
    end
  end

  private

  def item_params
      params.require(:item).permit(:name, :explanation, :status, :excluded, :genre_id, :item_image )
  end

end
