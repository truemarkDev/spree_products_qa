class Spree::ProductAnswer < ActiveRecord::Base
  belongs_to :product_question

  validates :content, presence: true

  after_create :send_email, if: ->() { SpreeProductsQa.send_email? }

  def send_email
    QaMailerWorker.perform_async(self.question.id) if self.question.present?
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id product_question_id user_id content is_visible]
  end
end
