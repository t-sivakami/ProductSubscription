class DepositoryController < ApplicationController
	before_action :authenticate_user!

	def index
		@depository_products = current_user.depository_additions
		@user = current_user
	end

	def new
		#@depository = current_user.depository_additions
	end

	def create
	end
end
