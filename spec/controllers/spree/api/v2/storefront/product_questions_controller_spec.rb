require 'spec_helper'

describe Spree::Api::V2::Storefront::ProductQuestionsController, type: :request do
  let!(:user) { create(:user) }
  let!(:product) { create(:product) }
  let!(:question) { create(:product_question, product_id: product.id, user_id: user.id) }
  let!(:visible_question) { create(:question_with_answer, product_id: product.id, is_visible: true) }

  before do
    allow_any_instance_of(described_class).to receive(:spree_current_user).and_return(user)
    allow_any_instance_of(described_class).to receive(:require_spree_current_user).and_return(user)
  end

  describe '#index' do
    it 'shows only visible questions associated with a product for an anonymous user' do
      allow_any_instance_of(described_class).to receive(:spree_current_user).and_return(nil)
      get "/api/v2/storefront/products/#{product.id}/product_questions"
      json_response = JSON.parse(response.body)

      expect(json_response['data']).to be_an(Array)
      question_ids = json_response['data'].map { |question| question['id'].to_i }

      expect(question_ids).to include(visible_question.id)
      expect(question_ids).not_to include(question.id)
    end

    it 'shows visible + pending questions asked by self for an authorized user' do
      get "/api/v2/storefront/products/#{product.id}/product_questions"
      json_response = JSON.parse(response.body)
      puts json_response

      expect(json_response['data']).to be_an(Array)
      question_ids = json_response['data'].map { |question| question['id'].to_i }

      expect(question_ids).to include(visible_question.id)
      expect(question_ids).to include(question.id)
    end
  end

  describe '#create' do
    let(:question_params) do
      {
        product_question: {
          content: 'What is the product lifespan ?'
        }
      }
    end

    it 'creates a new question' do
      post "/api/v2/storefront/products/#{product.id}/product_questions", params: question_params
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)

      puts json_response

      expect(json_response['data']).to have_attribute(:content).with_value('What is the product lifespan ?')
    end
  end

  describe '#update' do
    let(:question_params) do
      {
        product_question: {
          content: 'Question updated ?'
        }
      }
    end

    it 'updates a question' do
      # sign_in(user)
      put "/api/v2/storefront/products/#{product.id}/product_questions/#{question.id}", params: question_params

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)

      expect(json_response['data']).to have_attribute(:content).with_value('Question updated ?')
    end
  end

  describe '#destroy' do
    it 'deletes a question' do
      delete "/api/v2/storefront/products/#{product.id}/product_questions/#{question.id}"

      expect(response).to have_http_status(:ok)
    end
  end
end
