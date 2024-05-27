module Spree
  module Api
    module V2
      module Storefront
        module Account
          class ProductQuestionsAnswersController < ::Spree::Api::V2::ResourceController
            # GET /api/v2/storefront/account/product_questions_answers
            def index
              render_serialized_payload { serialize_collection(resource) }
            end

            private

            def resource
              if spree_current_user
                resource_finder.for_authorized_user(spree_current_user.id)
              else
                resource_finder.for_unauthorized_user
              end
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
