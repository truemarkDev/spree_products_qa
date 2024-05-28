module Spree
  module V2
    module Storefront
      module StoreSerializerDecorator
        def self.prepended(base)
          base.attributes :allow_anonymous_question
        end
      end
    end
  end
end

Spree::V2::Storefront::StoreSerializer.prepend(Spree::V2::Storefront::StoreSerializerDecorator)
