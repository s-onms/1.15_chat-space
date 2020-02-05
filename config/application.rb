require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
   config.time_zone = 'Tokyo'
  #  タイムゾーンの設定を追記
 
   config.generators do |g|
    g.stylesheets false
    g.javascripts false
    g.helper false
    g.test_framework false
    config.i18n.default_locale = :ja
    
   end
   # Settings in config/environments/* take precedence over those specified here.
   # 和訳：config / environments / *の設定は、ここで指定された設定よりも優先されます。
   
   # Application configuration should go into files in config/initializers
   # -- all .rb files in that directory are automatically loaded.
   # 和訳：アプリケーション構成はconfig / initializersのファイルに入れます
   #      ＃-そのディレクトリ内のすべての.rbファイルが自動的にロードされます。
  end
end
