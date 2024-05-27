class AddIsAnonymousToProductQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_product_questions, :is_anonymous, :boolean, default: false
    add_column :spree_product_questions, :email, :string
    add_column :spree_product_questions, :full_name, :string
  end
end
