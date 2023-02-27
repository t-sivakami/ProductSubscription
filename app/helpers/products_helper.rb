module ProductsHelper

	def user_added_to_depository? user, product
		user.depositories.where(user: user, product: product).any?
	end
	
end
