require 'rails_helper'

describe CommentsController do
  subject { response }
  let(:user) { create :user, :confirmed }
  let(:article) { create :article }

  before do
    allow(controller).to receive_messages(authenticate_user!: true, current_user: user)
  end

  describe 'POST create' do
    let(:params) { { text: 'test text' } }

    before do
      post :create, article_id: article.id, comment: params
    end

    it 'redirects to article path' do
      expect(response).to redirect_to(article)
    end

    it 'creates new user article' do
      expect(Comment.find_by(params)).not_to be_nil
    end
  end
end
