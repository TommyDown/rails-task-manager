class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new # Needed to instantiate the form_with
  end

  def create
     @task = Task.new(task_params)
     @task.save
     redirect_to task_path(@task)
  end



  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Restaurant.find(params[:id])
    @tasks.update(params[:task]) # Will raise ActiveModel::ForbiddenAttributesError
  end

  private

  def task_params
     params.require(:task).permit(:title, :details)
  end

  def update
    @tasks = Restaurant.find(params[:id])
    @tasks.update(task_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)

  end

end
