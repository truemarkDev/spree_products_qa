module SpreeProductQuestion
  module Admin
    module MainMenu
      class QuestionBuilder
        include ::Spree::Core::Engine.routes.url_helpers

        def build
          item = ::Spree::Admin::MainMenu::ItemBuilder.new('products_qa.config_name', pending_admin_product_questions_path).
                   with_availability_check(->(ability, _store) { ability.can?(:manage, ::Spree::ProductQuestion) && ability.can?(:index, ::Spree::ProductQuestion) }).
                   with_match_path('/pending').
                   build

          ::Spree::Admin::MainMenu::SectionBuilder.new('product_questions', 'question-square-fill.svg').
            with_item(item).
            build
        end
      end
    end
  end
end