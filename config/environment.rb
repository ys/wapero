# Load the rails application
require File.expand_path('../application', __FILE__)

Sass::Plugin.options[:style] = :expanded
Sass::Plugin.options[:line_numbers] = true

# Initialize the rails application
Wapero::Application.initialize!
