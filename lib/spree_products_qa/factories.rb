FactoryBot.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_products_qa/factories'
  # factory :user do
  #   email { "test@example.com" }
  #   password { "password" }
  # end

  factory :answer, class: Spree::ProductAnswer do
    content 'Answer'
  end

  factory :question, class: Spree::ProductQuestion do
    content 'What is the question?'
    association :product, factory: :base_product
    # factory :question_with_answer do
    #   answer
    # end
  end

  factory :question_answer, class: Spree::ProductQuestion do
        content 'What is the question ?'
        association :product, factory: :base_product
        factory :question_with_answer do
          answer
        end
  end
end
