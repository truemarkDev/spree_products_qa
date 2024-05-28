module Spree
  class ProductQuestionSetting < Preferences::Configuration
    # Allow anonymous questions.
    preference :allow_anonymous, :boolean, default: true
  end
end
