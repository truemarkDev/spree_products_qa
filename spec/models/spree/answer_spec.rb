require 'spec_helper'

describe Spree::ProductAnswer do
  describe '#send_email' do
    let(:user) { create(:user) }
    let(:answer) { build(:product_answer, product_question: create(:product_question), user_id: user.id) }

    before do
      allow_any_instance_of(described_class).to receive(:user).and_return(user)
    end

    it 'should not queue the question' do
      expect {
        answer.save
      }.not_to have_enqueued_job.on_queue('default')
    end

    context 'with send_email enabled' do
      before(:each) do
        allow(SpreeProductsQa).to receive(:send_email?).and_return(true)
      end

      it 'should queue the question' do
        expect {
          answer.save
        }.to have_enqueued_job.on_queue('default')
      end
    end
  end
end
