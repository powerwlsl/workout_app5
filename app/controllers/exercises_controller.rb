class ExercisesController < ApplicationController
  def index
    @exercises = current_user.exercises.where("date > ?", 7.days.ago).order("date DESC")
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)
    if @exercise.save
      flash[:notice] = "Exercise has been created"
      redirect_to [current_user, @exercise]
    else
      flash.now[:alert] = "Exercise has not been created"
      render :new
    end
  end

  def edit
    @exercise = current_user.exercises.find(params[:id])
  end

  def update
    @exercise = current_user.exercises.find(params[:id])
    
    if @exercise.update(exercise_params)
      flash[:notice] = "Exercise has been updated"
      redirect_to [current_user, @exercise]
    else
      flash.now[:alert] = "Exercise has not been updated"
      render :edit
    end
  end

  def show
    @exercise = current_user.exercises.find(params[:id])  
  end

  private
    def exercise_params
      params.require(:exercise).permit(:duration,:detail,:date)
    end
end
