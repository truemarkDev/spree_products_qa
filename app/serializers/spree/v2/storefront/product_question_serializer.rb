module Spree
  module V2
    module Storefront
      class ProductQuestionSerializer < BaseSerializer
        set_type :product_question

        attributes :content, :is_visible, :is_anonymous, :full_name, :email

        has_one :product_answer
        has_one :user
        has_one :product
      end
    end
  end
end
