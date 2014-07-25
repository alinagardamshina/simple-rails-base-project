require 'rails_helper'

feature 'Create article by visitor' do
  let(:create_article_page) { Articles::New.new }

  scenario 'I try to create article' do
    create_article_page.load

    expect(current_path).to eql new_user_session_path
  end
end
