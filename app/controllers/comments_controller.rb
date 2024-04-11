class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)  # コメントと結びつくツイートの詳細画面に遷移する
    else
      flash.now[:alert] = @comment.errors.full_messages
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"  # prototypesコントローラーのshowアクションに定義されたインスタンス変数を使用して描画する
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end