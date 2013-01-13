class BlogCategory < ActiveRecord::Base
	has_many :blog_posts
	validates :name, :presence => true
	attr_accessible :name
end
