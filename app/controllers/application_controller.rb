# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?
  layout :determine_layout

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_root_path : doctors_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def determine_layout
    return 'devise' if devise_controller?

    'application'
  end

  def set_resource
    class_name = controller_name.chomp('Controller').chomp('Api').singularize.underscore.to_s
    instance_variable_set("@#{class_name}", class_name.camelize.constantize.find(params[:id]))
  end
end
