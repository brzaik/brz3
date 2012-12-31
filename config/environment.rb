# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Brz3::Application.initialize!

PageTitleHelper.options[:app] = "Brian R Zaik"
PageTitleHelper.options[:default] = "Brian R Zaik"