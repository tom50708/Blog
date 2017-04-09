class Admin::PostsController < ApplicationController
	layout "admin"
	before_action :authenticate_user!
	before_filter :configure_permitted_parameters, if: :devise_controller?
	def index
		@posts = Post.all
	end
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
	end
end

