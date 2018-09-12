Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_TzBIDvjnoiAVYRtWfSZqJisu'],
  secret_key:      ENV['sk_test_ijweKlnsJ57HmlRDyZEtXj6r']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
