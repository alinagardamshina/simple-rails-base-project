module Articles
  class Edit < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/articles{/article_id}/edit'

    element :article_title, '.title'
    element :article_text, '.text'

    element :update_article_button, 'input[value="Update Article"]'

    def submit_article_form(options)
      fill_form(
        :article,
        attributes_for(:article)
          .slice(*edit_article_attributes)
          .merge(options)
      )
      update_article_button.click
    end

    def edit_article_attributes
      %i(title text)
    end
  end
end
