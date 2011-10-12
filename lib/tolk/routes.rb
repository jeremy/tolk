module Tolk
  module Routes
    @@mounted = false
    mattr_accessor :mounted

    def self.mount(scope)
      return if mounted
      self.mounted = true

      scope.instance_eval do
        namespace 'tolk' do
          root :to => "locales#index"

          resources :locales do
            member do
              get 'all'
              get 'updated'
            end
          end

          resource :search
        end
      end
    end
  end
end
