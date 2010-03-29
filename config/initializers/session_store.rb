# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gainpad_session',
  :secret      => 'd04e538d271b05cbf3d9ac178f6660aeb21117935e39f44493da8c1626108cbb560d5357ff9d3cb7dd30328eb794966c4d6120c742d4083503dda1001828b6ea'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
