require 'spec_helper'

describe Spree::ProductQuestion do
  subject { build_stubbed(:question) }
  context "scopes" do
    let!(:question_with_answer){ create(:question_with_answer) }
    let!(:question_without_answer){ create(:question) }

    describe "answered" do
      it 'returns only answered questions' do
        expect(described_class.answered).to_not include(question_without_answer)
      end
    end

    describe 'not_answered' do
      it 'returns only questions without answers' do
        expect(described_class.not_answered).to_not include(question_with_answer)
      end
    end
  end

  context "methods" do
    describe "answer_for_form" do
      let(:answer){ build_stubbed(:answer) }

      it 'builds new answer if its not present' do
        expect(subject).to receive(:build_answer).once
        subject.answer_for_form
      end

      it 'returns answer if its present' do
        subject.stub(:answer).and_return(answer)
        expect(subject.answer_for_form).to eq answer
      end
    end
  end
end
