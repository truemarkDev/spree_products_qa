require 'spec_helper'

describe Spree::ProductQuestion do
  subject { build_stubbed(:product_question) }

  context 'scopes' do
    let!(:question_with_answer) { create(:question_with_answer) }
    let!(:question_without_answer) { create(:product_question) }

    describe 'answered' do
      it 'returns only answered questions' do
        expect(described_class.answered).to include(question_with_answer)
        expect(described_class.answered).not_to include(question_without_answer)
      end
    end

    describe 'not_answered' do
      it 'returns only questions without answers' do
        expect(described_class.not_answered).to include(question_without_answer)
        expect(described_class.not_answered).not_to include(question_with_answer)
      end
    end
  end

  context 'methods' do
    describe 'answer_for_form' do
      let(:answer) { build_stubbed(:product_answer, product_question: subject) }

      it 'builds new answer if its not present' do
        expect(subject).to receive(:build_product_answer).once
        subject.answer_for_form
      end

      it 'returns answer if its present' do
        subject.product_answer = answer
        expect(subject.answer_for_form).to eq(answer)
      end
    end

    describe 'for_user' do
      let(:user) { create(:user) }
      let(:question) { create(:product_question, user_id: user.id) }
      let(:visible_question) { create(:question_with_answer, is_visible: true) }

      it 'returns visible and pending questions by self for authorized user' do
        expect(described_class.for_user(user)).to include(question, visible_question)
      end

      it 'returns only visible questions for anonymous user' do
        expect(described_class.for_user).to include(visible_question)
        expect(described_class.for_user).not_to include(question)
      end
    end
  end
end
