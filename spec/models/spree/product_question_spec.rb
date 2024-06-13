require 'spec_helper'

describe Spree::ProductQuestion do
  context 'scopes' do
    let!(:user_1) { create(:user, email: 'first@test.com') }
    let!(:user_2) { create(:user, email: 'second@test.com') }

    let!(:valid_user_question) { create(:question_with_answer, user_id: user_1.id) }
    let!(:other_user_question) { create(:question_with_answer, user_id: user_2.id) }

    describe 'user_product_questions' do
      it 'returns only users questions and answers' do
        expect(described_class.user_product_questions(user_1).to_a).to_not include(other_user_question)
      end

      it 'returns valid queries' do
        expect(described_class.user_product_questions(user_1).to_a).to eq([valid_user_question])
      end
    end
  end
end
