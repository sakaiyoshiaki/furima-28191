require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Furima28191
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # 日本語の言語設定
    config.i18n.default_locale = :ja
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.assets.initialize_on_precompile = false #デプロイ関連
    config.autoload_paths << Rails.root.join("bin") #デプロイ関連：bin以下の読み込み
    # config.autoload_paths += Dir["#{config.root}/lib/**/"]
    # config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    # config.autoload_paths += Dir["#{config.root}/bin/**/"]
    # config.eager_load_paths += Dir["#{config.root}/bin/**/"]
  end
  class Application < Rails::Application
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end  #field_with_errorsの自動生成によるレイアウト崩れを防ぐ

end