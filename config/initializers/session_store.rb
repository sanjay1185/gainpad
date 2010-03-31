# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gainpad_session',
  :secret      => 'aaed4a4faf823a71538fcb43ca96aedb378629b26ddf92e8ecae46355767b44f4828f4ca0eea3de8fe6fd785d2a02700edc69bc39fd57b5395f4aed28e85b6d1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
