class Spree::ProductQuestion < ActiveRecord::Base
  belongs_to :product
  belongs_to :user, optional: true

  has_one :product_answer, dependent: :destroy

  accepts_nested_attributes_for :product_answer

  default_scope -> { order('spree_product_questions.created_at DESC') }
  scope :visible, -> { where(is_visible: true) }
  scope :answered, -> { joins(:product_answer) }
  scope :not_answered, -> { where.not(id: answered.pluck(:id)) }
  scope :user_product_questions, ->(user_id) { where('spree_product_questions.user_id = ?', user_id) }

  validates :content, presence: true

  def answer_for_form
    product_answer.presence || build_product_answer
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id product_id user_id content is_visible]
  end
end
