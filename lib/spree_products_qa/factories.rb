module SpreeProductsQa
  module Factories
    FactoryBot.define do
      factory :answer, class: Spree::ProductAnswer do
        content 'Answer'
      end

      factory :question, class: Spree::ProductQuestion do
        content 'What is the question?'
        association :product, factory: :base_product
        factory :question_with_answer do
          answer
        end
      end

      # factory :question_answer, class: Spree::ProductQuestion do
      #   content 'What is the question ?'
      #   association :product, factory: :base_product
      #   factory :question_with_answer do
      #     answer
      #   end
      # end
    end
  end
end
