require 'spec_helper'

describe ArticlesController do
  subject { response }

  describe 'POST create' do
    let(:params) { { title: 'test', text: 'test text' } }

    before do
      post :create, article: params
    end

    it { should redirect_to(root_path) }

    it 'creates new user article' do
      Article.find_by(params).should_not be_nil
    end
  end

  describe 'GET new' do
    it { should be_success }
  end

  describe 'GET show' do
    it { should be_success }
  end

  describe 'GET edit' do
    it { should be_success }
  end

  describe 'PATCH update' do
    let(:article) { create :article, title: 'tilte 1', text: 'text 1' }
    let(:params) { { title: 'titlt 2', text: 'text 2' } }

    before do
      patch :update, id: article.id, article: params
    end

    it { should redirect_to(root_path) }

    it 'update article' do
      expect(article.title).to eql 'title 2'
      expect(article.text).to eql 'text 2'
    end
  end
end
