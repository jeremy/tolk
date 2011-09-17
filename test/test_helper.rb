ENV['RAILS_ENV'] = 'test'
require 'rubygems'
require 'bundler/setup'
require 'tolk/engine'

require 'rails/all'
require 'test/unit'
require 'active_support/core_ext/kernel/requires'
require 'active_support/test_case'
require 'action_controller/test_case'
require 'action_dispatch/testing/integration'
require 'active_record/test_case'

require "webrat"

Webrat.configure do |config|
  config.mode = :rails
end

class Hash
  undef :ya2yaml
end

class ActiveSupport::TestCase
  include ActiveRecord::TestFixtures
  self.fixture_path = "#{Tolk::Engine.root}/test/fixtures/"
  ActionController::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path

  fixtures :all

  self.fixture_class_names = {
    :tolk_locales => 'Tolk::Locale',
    :tolk_phrases => 'Tolk::Phrase',
    :tolk_translations => 'Tolk::Translation'
  }
end

class ActionController::TestCase
  setup do
    @routes = Rails.application.routes
  end
end

class ActionDispatch::IntegrationTest
  setup do
    @routes = Rails.application.routes
  end
end
