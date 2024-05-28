module Spree
  module Admin
    class ProductQuestionSettingsController < ResourceController
      def update
        settings = Spree::ProductQuestionSetting.new

        preferences = params&.key?(:preferences) ? params.delete(:preferences) : params
        preferences.each do |name, value|
          next unless settings.has_preference? name
          settings[name] = value
        end
        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:product_question_settings, scope: :products_qa))
        redirect_to edit_admin_product_question_settings_path
      end
    end
  end
end
