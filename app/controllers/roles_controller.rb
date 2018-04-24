class RolesController < ApplicationController
  def new
    @role = Role.new
    @actors = Actor.all
    @movies = Movie.all
  end

  def edit
    @roles = Role.all
    @actors = Actor.all
    @movies = Movie.all
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
      redirect_to role_path(@role)
    else
      render 'new'
    end
  end

  def destroy
    @role= Role.find(params[:id])
    @role.destroy
    redirect_to action: "index"
  end


  private

  def role_params
    params.require(:role).permit(:character, :movie_id, :actor_id)
  end
end
