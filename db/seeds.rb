# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#It's important to use find_or_create_by_{attribute} so as to prevent duplicate creation of records

# Populate default project template:
Template.find_or_create_by_name(:template_name => "default_project")

# Create default homepage:
Page.find_or_create_by_name(:title => "Default Homepage", :description => "This is the default homepage", :is_homepage => true, :is_project => false, :template_id => 1)
