module SpreeProductQuestion
  module Admin
    module Tabs
      class ProductTabsBuilder
        include ::Spree::Core::Engine.routes.url_helpers

        def build
          add_questions_tab
        end

        private

        def add_questions_tab
          Spree::Admin::Tabs::TabBuilder.new('question', ->(resource) { admin_product_product_questions_path(resource) }).
            with_icon_key('question-square.svg').
            with_active_check.
            with_admin_ability_check(::Spree::ProductQuestion).
            build
        end
      end
    end
  end
end