module Articles
  class Show < SitePrism::Page
    include Formulaic::Dsl

    set_url '/articles{/article_id}'

    element :article_title, '.title'
    element :article_text, '.text'

    def title_text
      article_title.text
    end

    def text_text
      article_text.text
    end
  end
end
