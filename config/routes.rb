JellyfishLdapauth::Engine.routes.draw do
  scope '/api/v1' do
    # Auth
    devise_for :staff, controllers: { sessions: 'sessions' }

    devise_scope :staff do
      match '/staff/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    end
  end
end
