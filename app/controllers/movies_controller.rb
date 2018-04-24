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
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to action: "index"
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def index
    @movies = Movie.all
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :url)
  end

end
