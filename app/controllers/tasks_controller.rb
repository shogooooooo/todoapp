class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
    @board = Board.find(params[:board_id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    @board = Board.find(params[:board_id])
    if @task.save
      redirect_to board_tasks_path(@board)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end
  
  def destroy

  end
      
  private
  def task_params
    params.require(:task).permit(:title, :content)
  end
end