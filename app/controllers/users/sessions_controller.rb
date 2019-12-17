class Users::SessionsController < Devise::SessionsController
  # Override the action you want here.
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
end
