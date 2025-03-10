Rails.application.config.to_prepare do
  RailsAdmin::ApplicationController.class_eval do
    after_action :reload_rails_admin

    def reload_rails_admin
      action_to_reload_after = ['top_notices_token_urls']

      return unless action_to_reload_after.include? action_name

      RailsAdmin::Config.reset

      load("#{Rails.root}/config/initializers/rails_admin.rb")
    end
  end
end
