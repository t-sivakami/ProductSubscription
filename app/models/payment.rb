class Payment < ApplicationRecord
	attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year, :current_user
	belongs_to :user

def self.month_options
	Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
end

def self.year_options
	(Date.today.year..(Date.today.year+10)).to_a
end

def process_payment
	#customer = Stripe::Customer.create email: "test233@gmail.com", source: token
	#Stripe.api_key = 'sk_test_51MezFZE3LWLIIPudLbLU1OL7rIVqJJyBUNVFO9ehjtrfYj3yA5t3noxgZAQddgo2VYL0CN1CqfYcNBP8QUfyFTPZ00dqLnMvTo'
	pymt = Stripe::PaymentIntent.create amount: 1000,

	payment_method: 'pm_card_visa',

	currency: 'gbp'
end


	
end
