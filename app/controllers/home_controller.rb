class HomeController < ApplicationController

    def top
      @items = Item.page(params[:page]).reverse_order
      @genres = Genre.where(status: "有効")
        @genre = Genre.new
        @genre.name = "商品"
      end

end
