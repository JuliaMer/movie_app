class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @roles = @movie.roles # macht intern: Role.where(:movie_id => @movie.id)
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
    movie = Movie.find(params[:id])
    roles = movie.roles
    Movie.delete(movie, roles)
    redirect_to action: "index"
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:success] = "You updated the movie!"
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def index
    @movies = Movie.all
  end

  def search
    # @movies = Movie.where("title LIKE '%#{params[:search]}%'") # sicherheitslücke
    #
    # @movies = Movie.all.select { |movie| movie.title.downcase.include? params[:search].downcase } # sqlite
    #
    @movies = Movie.where("title LIKE '%' || ? || '%'", params[:search]).to_a # sqlite
    # @movies = Movie.where("title LIKE CONCAT('%', ?, '%')", params[:search]) # mysql
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :url)
  end
end

