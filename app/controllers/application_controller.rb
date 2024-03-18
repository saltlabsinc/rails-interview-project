class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate
    api_key = request.headers[:HTTP_API_KEY]
    if api_key.blank? || Tenant.where(api_key:).none?
      return render_unauthorized
    end
  end

  def render_unauthorized
    render json: { message: 'Unauthorized' }, status: :unauthorized
  end
end
