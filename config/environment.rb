# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Brz3::Application.initialize!

PageTitleHelper.options[:app] = "Two Weeks from Everywhere Productions"
PageTitleHelper.options[:default] = "Two Weeks from Everywhere Productions"