class ActorsController < ApplicationController

  def show
    @actor = Actor.find(params[:id])
    #debugger #remove later
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)    # Not the final implementation!
    if @actor.save
      flash[:success] = "You added a new actor to the database!"
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def delete
    @actor = Actor.find_by(params[:id])
    actor.destroy
    redirect_to action: "index"
  end

  def edit
    @actor = Actor.find_by(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])

    if @actor.update(actor_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end


  def index
    @actors = Actor.all
  end

  private

  def actor_params
    params.require(:actor).permit(:name)
  end

end
