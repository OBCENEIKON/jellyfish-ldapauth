Rails.application.routes.draw do
  mount JellyfishLdapauth::Engine => '/jellyfish_ldapauth'

  scope '/api/v1' do
    # Auth
    devise_for :staff, controllers: { sessions: 'sessions' }

    devise_scope :staff do
      match '/staff/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    end
  end
end
