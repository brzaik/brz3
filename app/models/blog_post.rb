class BlogPost < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :blog_category
  has_many :blog_comments
  belongs_to :user
  validates :title, :presence => true
  validates :body, :presence => true

	attr_accessible :title, :blog_category_id, :body
end
