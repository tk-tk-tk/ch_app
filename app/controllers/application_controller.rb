class ApplicationController < ActionController::Base
  before_filter :congfigure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
    def congfigure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

end
