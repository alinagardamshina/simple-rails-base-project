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
end
