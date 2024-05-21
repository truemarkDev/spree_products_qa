module Spree
  module Api
    module V2
      module Storefront
        module Account
          class ProductQuestionsAnswersController < ::Spree::Api::V2::ResourceController
            # before_action :require_spree_current_user

            # GET /api/v2/storefront/account/product_questions_answers
            def index
              puts "\n\n\n index----------------------------------- \n\n\n"
              render_serialized_payload { serialize_collection(resource) }
              # render json: { qas: resource_finder.user_product_questions(1) }
            end

            private

            def resource
              # resource_finder.user_product_questions(spree_current_user.id)
              resource_finder.user_product_questions(1)
            end

            def collection_serializer
              Spree::V2::Storefront::ProductQuestionSerializer
            end

            def serialize_collection(collection)
              collection_serializer.new(
                collection,
                include: resource_includes,
                fields: sparse_fields
              ).serializable_hash
            end

            def resource_finder
              Spree::ProductQuestion
            end
          end
        end
      end
    end
  end
end
