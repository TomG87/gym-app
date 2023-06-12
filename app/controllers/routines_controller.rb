class RoutinesController < ApplicationController

  def index
    @routines = Routine.where(user_id: current_user.id)
    render :index
  end

  def create
    if current_user
      @routine = Routine.new(
        exercise_id: params[:exercise_id],
        repetitions: params[:repetitions],
        user_id: current_user.id
      )
      if @routine.save
        render json: { message: "New Routine Added" }
      else
        render json: { errors: @routine.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "Please Log-in" }, status: :unprocessable_entity
    end
  end
end
