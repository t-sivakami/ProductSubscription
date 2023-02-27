Rails.configuration.stripe = {
  :publishable_key => 'pk_test_51MezFZE3LWLIIPudTSQ9kZZX8WH2b11oDn2f5rAourGjQ432swRSfQnssvT6DxpvAvzvOBmxir2txPVgSKOIU72c00RQWOrVOi',
  :secret_key => 'sk_test_51MezFZE3LWLIIPudLbLU1OL7rIVqJJyBUNVFO9ehjtrfYj3yA5t3noxgZAQddgo2VYL0CN1CqfYcNBP8QUfyFTPZ00dqLnMvTo'

}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

