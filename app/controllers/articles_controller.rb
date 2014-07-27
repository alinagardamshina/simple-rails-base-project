require 'github/markdown'

class ArticlesController < ApplicationController
  expose(:articles, ancestor: :current_user)
  expose(:article, attributes: :article_attributes)

  def create
    article.save
    redirect_to root_path
  end

  def update
    article.save
    redirect_to root_path
  end

  private

  def article_attributes
    params.require(:article).permit(:title, :text)
  end
end
