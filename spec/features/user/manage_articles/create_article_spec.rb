require 'rails_helper'

feature 'Create article' do
  let(:user) { create :user, :confirmed }

  let(:login_page) { Devise::Sessions::New.new }
  let(:create_article_page) { Articles::New.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'Create article' do
    create_article_page.load
    create_article_page.submit_article_form title: 'test', text: 'test text'

    expect(Article.find_by(title: 'test')).to_not eql nil
  end
end
