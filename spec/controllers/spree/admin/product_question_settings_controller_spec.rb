require 'spec_helper'

describe Spree::Admin::ProductQuestionSettingsController do
  describe '#update' do
    it 'updates the allow anonymous question setting to false' do
      spree_put :update, params: { allow_anonymous_questions: false }
      expect(SpreeProductsQa::Config[:allow_anonymous]).to eq(true)
    end

    it 'updates the allow anonymous question setting to true' do
      spree_put :update, params: { allow_anonymous_questions: true }
      expect(SpreeProductsQa::Config[:allow_anonymous]).to eq(true)
    end
  end
end
