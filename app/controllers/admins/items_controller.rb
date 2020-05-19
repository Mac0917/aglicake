class Admins::ItemsController < ApplicationController


def index
  	@items = Item.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
      @item = Item.find(params[:id])
      @genre = @item.genre
  end

  def edit
  	  @item = Item.find(params[:id])
      @genres = Genre.all
  end

  def update
  	@item = Item.find(params[:id])

    if @item.update(item_params)
    	flash[:notice] = "Item was successfully edited."
    redirect_to admins_items_path
     else
     redirect_to admins_items_path
   end
  end

  def create
  	 @item = Item.new(item_params)

     if @item.save
     	flash[:notice] = "商品を追加しました"
     redirect_to admins_items_path
     else
      flash[:notice] = "商品を追加出来ませんでした"
     redirect_to admins_items_path

     end
  end

private
    def item_params
      params.require(:item).permit(:name, :explanation, :status, :excluded, :genre_id)
    end



end

