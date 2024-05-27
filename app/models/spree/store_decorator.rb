module Spree
  module StoreDecorator
    def allow_anonymous_question
      SpreeProductsQa::Config[:allow_anonymous]
    end
  end
end

Spree::Store.prepend(Spree::StoreDecorator)
