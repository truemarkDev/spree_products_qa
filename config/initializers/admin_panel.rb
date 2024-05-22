Rails.application.config.after_initialize do
  if Spree::Core::Engine.backend_available?
    Rails.application.config.spree_backend.main_menu.insert_before('users', ::SpreeProductQuestion::Admin::MainMenu::QuestionBuilder.new.build)
  end
end