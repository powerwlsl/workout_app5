class ExercisesController < ApplicationController

  before_action :set_exercise, only: [:edit, :update, :show, :destroy]

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
  end

  def update    
    if @exercise.update(exercise_params)
      flash[:notice] = "Exercise has been updated"
      redirect_to [current_user, @exercise]
    else
      flash.now[:alert] = "Exercise has not been updated"
      render :edit
    end
  end

  def show
  end

  def destroy
    if @exercise.destroy
      flash[:notice] = "Exercise has been deleted"
      redirect_to user_exercises_path(current_user)
    else
      flash.now[:alert] = "Exercise has not been deleted"
      redirect_to [current_user, @exercise]
    end

  end

  private
    def exercise_params
      params.require(:exercise).permit(:duration,:detail,:date)
    end

    def set_exercise
      @exercise = current_user.exercises.find(params[:id])
    end
end
