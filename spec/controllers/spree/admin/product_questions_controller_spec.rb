require 'spec_helper'

describe Spree::Admin::ProductQuestionsController do
  stub_authorization!

  describe '#index' do
    let!(:question) { create(:product_question) }

    it 'shows a list of questions associated with a product' do
      spree_get :index, product_id: question.product.slug
      assigns[:collection].should_not be_empty
      assigns[:collection].should include(question)
    end
  end

  describe '#pending' do
    let!(:question) { create(:product_question) }

    it 'shows products with pending questions' do
      spree_get :pending
      assigns[:collection].should_not be_empty
      assigns[:collection].should include(question.product)
    end
  end
end
