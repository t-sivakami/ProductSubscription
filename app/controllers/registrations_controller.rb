class RegistrationsController < Devise::RegistrationsController
	 # DELETE /resource/sign_out
    def after_sign_out_path_for(resource)
	    root_path
	end
	protected

	def sign_up_params
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
	end

	def after_sign_up_path_for(resource)
		'/subscriptions/new'
	end


end
