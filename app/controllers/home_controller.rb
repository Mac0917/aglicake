class HomeController < ApplicationController

    def top
      @items = Item.order("RANDOM()").limit(4)
      @genres = Genre.where(status: "有効")
        @genre = Genre.new
        @genre.name = "商品"
      end

end
