Rails.application.config.after_initialize do
  if Spree::Core::Engine.backend_available?
    Rails.application.config.spree_backend.main_menu.insert_before('users', SpreeProductsQa::Admin::MainMenu::QuestionBuilder.new.build)

    Rails.application.config.spree_backend.tabs[:product].add(SpreeProductsQa::Admin::Tabs::ProductTabsBuilder.new.build)
  end
end
