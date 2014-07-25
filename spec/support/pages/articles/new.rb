module Articles
  class New < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/articles/new'

    element :create_article_button, 'input[value="Create Article"]'

    def submit_article_form(options)
      fill_form(
        :article,
        attributes_for(:article)
          .slice(*new_article_attributes)
          .merge(options)
      )
      create_article_button.click
    end

    def new_article_attributes
      %i(title text)
    end
  end
end
