class SessionsController < Devise::SessionsController
  respond_to :json, :html

  def create
    if request.env['omniauth.auth']
      auth_hash = request.env['omniauth.auth']

      user = Staff.find_by_auth(auth_hash)

      if user
        sign_in(resource_name, user)
        render json: user
      else
        render json: { error: 'Invalid Login' }, status: 401
      end
    else
      super
    end
  end
end
