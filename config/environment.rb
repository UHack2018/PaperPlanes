# Load the Rails application.
require_relative 'application'
Time::DATE_FORMATS[:default] = "%d/%m/%Y %l:%M%p"
# Initialize the Rails application.
Rails.application.initialize!
