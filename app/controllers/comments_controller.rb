class CommentsController < ApplicationController

  def new
    @board = Board.find(params[:board_id])
    @card = Card.find(params[:card_id])
    @comment = @card.comments.build
  end

  def create
    @board = Board.find(params[:board_id])
    @card = Card.find(params[:card_id])
    @comment = @card.comments.build(comment_params)
    if @comment.save
      redirect_to board_card_path(board_id: @card.board_id,id: @card.id),notice:'コメント追加'
    else 
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  private 

  def comment_params 
    params.require(:comment).permit(:content).merge(user_id: current_user.id,board_id: @board.id)
  end

end