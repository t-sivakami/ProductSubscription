class SubscriptionsController < ApplicationController
  before_action :authenticate_user!#, except: [:new, :create]

def new
  if user_signed_in? && current_user.subscribed
    redirect_to root_path, notice: "You are already a subscribed user"
  end
end

def create

# build_resource(sign_up_params)

resource = current_user
 resource.class.transaction do
 
 resource.save

 yield resource if block_given?

if resource

    @payment = Payment.new({ email: current_user.email, user_id: resource.id })

    flash[:error] = "Please check registration errors" unless @payment.valid?

    begin
   # @payment.current_user =  resource
    @payment.process_payment

    @payment.save
    resource.update_attribute(:subscribed, true)

    rescue Exception => e

    flash[:error] = e.message

    puts "check errors"

    puts e.message

    resource.destroy

    puts 'Payment failed'

    render :new and return

    end

if resource.active_for_authentication?

flash[:notice] = "Thankyou!"
#set_flash_message :notice, :signed_up if is_flashing_format?

#sign_up(resource_name, resource)
#redirect_to '/subscriptions/landing'

redirect_to "http://localhost:3000/subscriptions/landing"

#respond_with resource, location: after_sign_up_path_for(resource)


end

def show
  render template: "subscriptions/landing"
end

else

clean_up_passwords resource

set_minimum_password_length

respond_with resource

end

end

end


  # def create

  #   puts "SSSSSSSSSSSSSSSSSSSSSS"
  #   params.inspect
  #   puts "0000000000000000000000"

  #   Stripe.api_key = Rails.configuration.stripe[:secret_key]

  #   plan_id = params[:plan_id]
  #   plan = Stripe::Plan.retrieve(plan_id)
  #   token = params[:stripeToken]
  #   puts "qqqqqqqqqqqqqqqqqq"
  #   params.inspect
  #   puts "xxxxxxxxxxxxxxxxx"
  #   customer = if current_user.stripe_id?
  #               Stripe::Customer.retrieve(current_user.stripe_id)
  #              else
  #               Stripe::Customer.create(email: current_user.email, source: token)
  #             end

  #   subscription = customer.subscriptions.create(plan: plan.id)

  #   options = {
  #     stripe_id: customer.id,
  #     stripe_subscription_id: subscription.id,
  #     subscribed: true
  #   }

  #   options.merge!(
  #     card_last4: params[:user][:card_last4],
  #     card_exp_month: params[:user][:card_exp_month],
  #     card_exp_year: params[:user][:card_exp_year],
  #     card_type: params[:user][:card_type]
  #   ) if params[:user][:card_last4]

  #   current_user.update(options)

  #   redirect_to root_path, notice: "You have successfully subscribed!"
  # end


  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)
    current_user.subscribed = false

    redirect_to root_path, notice: "Your subscription has been cancelled."
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:payment)
  end



end