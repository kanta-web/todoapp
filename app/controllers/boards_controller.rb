class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @cards = @board.cards
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board),notice: '保存できた'
    else
      flash.now[:error] = '保存失敗'
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board),notice: '更新できた'
    else
      flash.now[:error]= '更新失敗'
      render :edit
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to root_path,notice: '削除できたよ'
  end

  # def has_written?(board)
  #   boards.exists?(id: board.id)
  # end

  private
  def board_params
    params.require(:board).permit(:title,:content)
  end

end
