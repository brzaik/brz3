class Page < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :description, :is_highlight, :template_id, :title, :meta_description, :tag_ids
  attr_accessible :image_attributes

  belongs_to :template
  has_many :sections
  has_many :images, :as => :imageable
  has_many :videos, :as => :videoable
  has_one :upload
  has_and_belongs_to_many :tags

  scope :homepage, where(:is_homepage => true)
  scope :non_homepages, where(:is_homepage => false)

  validates_uniqueness_of :title

  friendly_id :title, :use => :slugged

end
