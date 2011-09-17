require 'rails/plugin'
require 'rails/engine'
require 'tolk'

module Tolk
  class Engine < ::Rails::Engine
    rake_tasks do
      load 'tasks/tolk_tasks.rake'
    end

    initializer 'serve assets' do |app|
      app.middleware.insert_before ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
