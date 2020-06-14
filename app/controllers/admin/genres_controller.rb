class Admin::GenresController < ApplicationController
  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  		redirect_back(fallback_location: root_path)
  	else
  		@genres = Genre.all
  		render :index
  	end
  end

  def edit
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :is_valid)
  end
end