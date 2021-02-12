# frozen_string_literal: true

class BoardsController < ApplicationController
   
  
  
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy
    redirect_to root_path, notice: 'Successfully deleted'
  end

 
  
end

