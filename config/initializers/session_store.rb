# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_questionyourcandidates_session',
  :secret      => '571ab3858e3a5273d1cc89f51b82885810030c809d855186498b5616f6aec75374a4b274602d1d894096ce64fb461a52ba56b2467aaeed0d640ec1c6000a2743'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
