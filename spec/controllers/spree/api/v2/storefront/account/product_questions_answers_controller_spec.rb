require 'spec_helper'

describe Spree::Api::V2::Storefront::Account::ProductQuestionsAnswersController, type: :request do
  let!(:user) { create(:user) }
  let!(:product) { create(:product) }
  let!(:question) { create(:product_question, product_id: product.id, user_id: user.id) }
  let!(:visible_question) { create(:question_with_answer, product_id: product.id, is_visible: true) }

  before do
    allow_any_instance_of(described_class).to receive(:spree_current_user).and_return(user)
    allow_any_instance_of(described_class).to receive(:require_spree_current_user).and_return(user)
  end

  describe '#index' do
    it 'shows only the questions asked by self' do
      get '/api/v2/storefront/account/product_questions_answers'
      json_response = JSON.parse(response.body)

      expect(json_response['data']).to be_an(Array)
      question_ids = json_response['data'].map { |question| question['id'].to_i }

      expect(question_ids).not_to include(visible_question.id)
      expect(question_ids).to include(question.id)
    end
  end
end
