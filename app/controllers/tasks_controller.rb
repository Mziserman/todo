class TasksController < ApplicationController
  def index
    @tasks = Task.all

    render json: @tasks
  end

  def create
    if @task = Task.create(params.require(:task).permit(:name, :done))
      render json: @task
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(params.require(:task).permit(:name, :done))
      render json: @task
    end
  end

  def show
    @task = Task.find(params[:id])
    render json: @task
  end
end
