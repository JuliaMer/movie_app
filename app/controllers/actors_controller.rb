class ActorsController < ApplicationController

  def show
    @actor = Actor.find(params[:id])
    debugger #remove later
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)    # Not the final implementation!
    if @actor.save
      flash[:success] = "You added a new actor to the database!"
      redirect_to @actor
    else
      render 'new'
    end
  end

  private

  def actor_params
    params.require(:actor).permit(:name)
  end
end
