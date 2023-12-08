class CommentsController < ApplicationController

  def create
    if @comments = Comment.create(comment_params)
      redirect_to "/prototypes/#{@comments.prototype.id}"
    else
      render "prototype/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
