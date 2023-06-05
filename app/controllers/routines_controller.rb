class RoutinesController < ApplicationController
  def index
    @routines = Routine.all
    render :index
  end

  def create
    if current_user
      @routine = Routine.new(
      exercise_id: params[:exercise_id],
      repetitions: params[:repetitions]
    )
      @routine.save
      render json: { message: "New Routine Added" } 
    else
    render json: { message: "Please Log-in" } 
    end
  end
end
