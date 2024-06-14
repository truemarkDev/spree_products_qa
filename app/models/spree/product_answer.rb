class Spree::ProductAnswer < ActiveRecord::Base
  belongs_to :product_question

  validates :content, presence: true

  after_create :send_email, if: ->() { SpreeProductsQa.send_email? }

  def send_email
    QaAnswerMailer.answer_email(self.product_question).deliver_later if self.product_question.present?
  end
end
