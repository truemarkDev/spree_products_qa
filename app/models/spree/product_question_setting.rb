module Spree
  class ProductQuestionSetting < Preferences::Configuration
    # Allow anonymoues questions.
    preference :allow_anonymous, :boolean, default: true
  end
end
