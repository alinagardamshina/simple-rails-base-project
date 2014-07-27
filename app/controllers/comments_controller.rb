require 'github/markdown'

class CommentsController < ApplicationController
  expose(:articles, ancestor: :current_user)
  expose(:article)
  expose(:comments, ancestor: :article) do |default|
    default.where user_id: current_user.id
  end
  expose(:comment, attributes: :comment_attributes)

  def create
    comment.save
    redirect_to article
  end

  private

  def comment_attributes
    params.require(:comment).permit(:text)
  end
end
