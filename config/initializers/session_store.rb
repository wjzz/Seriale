# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_seriale_session',
  :secret      => 'c5f2f7faf4d755ef44af2353c7059ace65f9ac0101d0b7e2b56dddab39241d32a9a7f3506847e52f435b5553ff5d1f8e1ec672e53f5b80c853c90116692fa101'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
