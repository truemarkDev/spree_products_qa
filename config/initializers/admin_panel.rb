Rails.application.config.after_initialize do
  if Spree::Core::Engine.backend_available?
    Rails.application.config.spree_backend.main_menu.insert_before('users', SpreeProductQuestion::Admin::MainMenu::QuestionBuilder.new.build)

    Rails.application.config.spree_backend.tabs[:product].add(SpreeProductQuestion::Admin::Tabs::ProductTabsBuilder.new.build)
  end
end
