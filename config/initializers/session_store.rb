# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_FoodRun_session',
  :secret      => '5d01f602bc343c239f8fd1c3ce2a1d9df0ce968577608cc14bfa63a21f7c011b6823d3597eef796fd60541d07c2d532495e72e0e7983d43015d63fc3aecb4b3d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
