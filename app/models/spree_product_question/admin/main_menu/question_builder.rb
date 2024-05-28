module SpreeProductQuestion
  module Admin
    module MainMenu
      class QuestionBuilder
        include ::Spree::Core::Engine.routes.url_helpers

        def build
          items = [ 
                    Spree::Admin::MainMenu::ItemBuilder.new('products_qa.pending_questions', pending_admin_product_questions_path).
                      with_availability_check(->(ability, _store) { ability.can?(:manage, ::Spree::ProductQuestion) && ability.can?(:index, ::Spree::ProductQuestion) }).
                      with_match_path('/product_questions/pending').
                      build,
                    Spree::Admin::MainMenu::ItemBuilder.new('products_qa.product_question_settings', edit_admin_product_question_settings_path).
                      with_availability_check(->(ability, _store) { ability.can?(:manage, ::Spree::ProductQuestionSetting) }).
                      with_match_path('/product_question_settings/edit').
                      build
                  ]

          Spree::Admin::MainMenu::SectionBuilder.new('product_questions', 'question-square-fill.svg').
            with_items(items).
            build
        end
      end
    end
  end
end
