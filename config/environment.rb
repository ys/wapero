# Load the rails application
require File.expand_path('../application', __FILE__)
# We use merge keys in our test config files, which Psych dislikes,
# so forcing Syck YAML Parser for now
require 'yaml' 
YAML::ENGINE.yamler = 'syck'
Sass::Plugin.options[:style] = :expanded
Sass::Plugin.options[:line_numbers] = true

# Initialize the rails application
Wapero::Application.initialize!
