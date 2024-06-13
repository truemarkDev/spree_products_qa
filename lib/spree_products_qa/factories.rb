module SpreeProductsQa
  module Factories
    FactoryBot.define do
      factory :product_question, class: 'Spree::ProductQuestion' do
        content { 'What is the question?' }
        association :product, factory: :base_product
        # association :user, factory: :custom_user

        factory :question_with_answer do
          after(:create) do |question|
            create(:product_answer, product_question: question)
          end
        end
      end

      factory :product_answer, class: 'Spree::ProductAnswer' do
        content { 'Answer' }
        association :product_question
      end
    end
  end
end
