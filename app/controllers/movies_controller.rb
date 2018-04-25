class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @roles = Role.where(:movie_id => @movie.id)
    #@movies = Movie.where(:title.to_s).includes(:search.to_s)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = "You added a new movie to the database!"
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @role = Role.find_by_movie_id(@movie.id)
    @movie.destroy
    @role.destroy
    redirect_to action: "index"
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def index
    @movies = Movie.all
  end

  def search
    @movies = Movie.where("title LIKE '%#{params[:search]}%'")
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :url)
  end
end

