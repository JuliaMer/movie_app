class RolesController < ApplicationController

  before_action :login_confirmation

  def new
    @role = Role.new
    @actors = Actor.all
    @movies = Movie.all
  end

  def edit
    @role = Role.find(params[:id])
  end

  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
    @actors = Actor.all
    @movies = Movie.all
  end

  def create
    @actor_id = @role_actor_id
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = "You added a new role to the database!"
      redirect_to movie_path(@role.movie_id)
    else
      render 'new'
    end
  end

  def destroy
    @role = Role.find(params[:id])
    movie = @role.movie_id
    @role.destroy
    flash[:success] = "Role was deleted!"
    redirect_to movie_path(movie)
  end

  def update
    @role = Role.find(params[:id])
    if @role.update(role_params)
      flash[:success] = "You updated the role!"
      redirect_to role_path(@role)
    else
      render 'edit'
    end
  end

  private

  def role_params
    params.require(:role).permit(:character, :movie_id, :actor_id)
  end
end
