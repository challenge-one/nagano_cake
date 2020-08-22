class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def create
  	@genre = Genre.new(genres_params)
    @genres = Genre.all
  	if @genre.save
      flash[:notice] = "ジャンルを追加しました"
  	  redirect_to admin_genres_path
    else
      render 'index'
    end
  end

  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genres_params)
     flash[:notice]="#{@genre.name}を編集しました"
  	 redirect_to admin_genres_path
    else render 'edit'
    end
  end

  private
  def genres_params
  	params.require(:genre).permit(:name,:status)
  end
end
