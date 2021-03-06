class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @board = Board.find(params[:board_id])
  end

  def show
    @board = Board.find(params[:board_id])
    @task = Task.find(params[:id])
    @comments = @task.comments
  end

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_tasks_path(board)
    else
      render :new
    end
  end

  def edit
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
  end

  def update
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_tasks_path(board)
    else
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:id])
    task.destroy
    redirect_to board_tasks_path(board)
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :eyecatch)
  end
end
