class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    #debugger #remove later
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)    # Not the final implementation!
    if @movie.save
      flash[:success] = "You added a new movie to the database!"
      redirect_to @movie
    else
      render 'new'
    end
  end

  def index
    @movies = Movie.all
  end


  private

  def movie_params
    params.require(:movie).permit(:title)
  end

end
