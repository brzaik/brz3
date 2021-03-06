class BlogComment < ActiveRecord::Base
	belongs_to :blog_post
	validates :body, :presence => true
	validates :name, :presence => true
	validates :email, :presence => true

	attr_accessible :body, :name, :email, :website
end
