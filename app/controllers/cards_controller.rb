class  CardsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create,:edit,:destroy]

  def new
    @board = Board.find(params[:board_id])
    @card = @board.cards.build
  end

  def create
    @board = Board.find(params[:board_id])
    @card = @board.cards.build(card_params)
    if @card.save
      redirect_to board_path(@card),notice: '保存できました'
    else
      flash.now[:error]='保存に失敗しました'
      render :new
    end
  end

  def show 
    @board = Board.find(params[:board_id])
    @card = Card.find(params[:id])
    @comments = @card.comments 
  end

  def edit
    @board = Board.find(params[:board_id])
    @card = board.cards.find(params[:id])
  end

  def update
    @board = Board.find(params[:board_id])
    @card = @board.cards.find(params[:id])
    @card.update(card_params)
    redirect_to board_card_path,notice: '更新しました'
  end

  def destroy
    card = current_user.card.find(params[:id])
    card.destroy!
    redirect_to root_path,notice:'削除に成功しました'
  end

  private
  def card_params
    params.require(:card).permit(:name,:content,:eyecatch)
  end

end