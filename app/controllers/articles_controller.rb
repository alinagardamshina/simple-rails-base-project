require 'github/markdown'

class ArticlesController < ApplicationController
  expose(:articles, ancestor: :current_user)
  expose(:article, attributes: :article_attributes)
  expose(:comments, ancestor: :article)

  def create
    article.save
    redirect_to root_path
  end

  def update
    article.save
    redirect_to root_path
  end

  def current_user_article?
    article.user == current_user
  end

  helper_method :current_user_article?

  private

  def article_attributes
    params.require(:article).permit(:title, :text)
  end
end
