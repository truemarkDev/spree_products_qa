# require 'spec_helper'

# describe Spree::ProductAnswer do
#   describe '#send_email' do
#     let(:answer) { build(:answer, question: create(:question)) }

#     it 'should not queue the question' do
#       expect {
#         answer.save
#       }.to_not change(QaMailerWorker.jobs, :size)
#     end

#     context 'with send_email enabled' do
#       before(:each) do
#         allow(SpreeProductsQa).to receive(:send_email?).and_return(true)
#       end

#       it 'should queue the question' do
#         expect {
#           answer.save
#         }.to change(QaMailerWorker.jobs, :size).by(1)
#       end
#     end
#   end
# end
