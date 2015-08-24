# config/initializers/devise_permitted_parameters.rb
module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:profile_image]
    devise_parameter_sanitizer.for(:account_update) << [:email, :profile_image]
  end

end

DeviseController.send :include, DevisePermittedParameters
