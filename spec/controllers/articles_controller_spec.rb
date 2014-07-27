require 'rails_helper'

describe ArticlesController do
  subject { response }
  let(:user) { create :user, :confirmed }
  let(:article) { create :article, user: user }

  before do
    allow(controller).to receive_messages(authenticate_user!: true, current_user: user)
  end

  describe 'POST create' do
    let(:params) { { title: 'test', text: 'test text' } }

    before do
      post :create, article: params
    end

    it 'redirects to root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'creates new user article' do
      expect(Article.find_by(params)).not_to be_nil
    end
  end

  describe 'GET new' do
    it 'should be success' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'GET show' do
    it 'should be success' do
      get :show, id: article.id
      expect(response).to be_success
    end
  end

  describe 'GET edit' do
    it 'should be success' do
      get :edit, id: article.id
      expect(response).to be_success
    end
  end

  describe 'PATCH update' do
    let(:params) { { title: 'title 2', text: 'text 2' } }

    before do
      patch :update, id: article.id, article: params
    end

    it 'redirects to root path' do
      expect(response).to redirect_to(root_path)
    end

    it 'update article' do
      expect(article.reload.title).to eql 'title 2'
      expect(article.reload.text).to eql 'text 2'
    end
  end
end
