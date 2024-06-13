# require 'spec_helper'

# describe QaMailerWorker do
#   describe '#perform', sidekiq: :inline do
#     let(:question) { create(:question_with_answer) }
#     let(:user)     { double('User', email: 'email@example.com') }

#     it 'will deliver an email' do
#       allow_any_instance_of(Spree::Question).to receive(:user).and_return(user)
#       expect {
#         subject.perform(question.id)
#       }.to change(ActionMailer::Base.deliveries, :size)
#     end

#     context 'without a user' do
#       it 'will not deliver an email' do
#         expect {
#           subject.perform(question.id)
#         }.to_not change(ActionMailer::Base.deliveries, :size)
#       end
#     end
#   end
# end
