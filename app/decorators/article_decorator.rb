module ArticleDecorator
  def current_user_article?
    current_user == user
  end
end
