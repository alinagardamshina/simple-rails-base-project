require 'rails_helper'

feature 'Show article' do
  let(:user) { create :user, :confirmed }
  let(:article) { create :article, user: user, title: 'test', text: 'test text' }

  let(:login_page) { Devise::Sessions::New.new }
  let(:show_article_page) { Articles::Show.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'Show article' do
    show_article_page.load article_id: article.id

    expect(show_article_page.title_text).to eql 'test'
    expect(show_article_page.text_text).to eql 'test text'
  end
end
