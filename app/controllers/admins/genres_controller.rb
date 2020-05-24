class Admins::GenresController < ApplicationController

    before_action :authenticate_admin!

    def index
      	@genres = Genre.all
        @genre = Genre.new
      end


      def edit
      	  @genre = Genre.find(params[:id])
      end

      def update
      	@genre = Genre.find(params[:id])

        if @genre.update(genre_params)

        redirect_to admins_genres_path
         else
         redirect_to admins_genres_path
       end
      end

      def create
      	 @genre = Genre.new(genre_params)

         if @genre.save
         	flash[:notice] = ""
         redirect_to admins_genres_path
         else
          flash[:notice] = ""
         redirect_to admins_genres_path
         end
      end

    def destroy
      	  @genre = Genre.find(params[:id])
      	  @genre.destroy
          redirect_to admins_genres_path
      end


    private
        def genre_params
          params.require(:genre).permit(:name, :status)
        end

end