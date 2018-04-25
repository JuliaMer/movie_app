class ActorsController < ApplicationController

  def show
    @actor = Actor.find(params[:id])
    @roles = Role.where(:actor_id => @actor.id)
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:success] = "You added a new actor to the database!"
      redirect_to actor_path(@actor)
    else
      render 'new'
    end
  end

  def destroy
    @actor = Actor.find(params[:id])
    @role = Role.find_by_actor_id(@actor.id)
    @actor.destroy
    @role.destroy
    redirect_to action: "index"
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])
    if @actor.update(actor_params)
      redirect_to actor_path(@actor)
    else
      render 'edit'
    end
  end

  def index
    @actors = Actor.all
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :birthday)
  end

end
