require 'rails_helper'

feature 'Edit article' do
  let(:user) { create :user, :confirmed }
  let(:article) { create :article, user: user, title: 'test', text: 'test text' }

  let(:login_page) { Devise::Sessions::New.new }
  let(:edit_article_page) { Articles::Edit.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'Edit article' do
    edit_article_page.load article_id: article.id
    edit_article_page.submit_article_form(title: 'New awesome title', text: 'Lorem ipsum')

    expect(article.reload.title).to eql 'New awesome title'
    expect(article.reload.text).to eql 'Lorem ipsum'
  end
end
