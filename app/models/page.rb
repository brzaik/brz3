class Page < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :description, :is_highlight, :template_id, :title, :meta_description, :tag_ids
  attr_accessible :image_attributes

  belongs_to :template
  has_many :sections
  has_one :upload
  has_and_belongs_to_many :tags

  scope :highlighted, where(:is_highlight => true)
  scope :non_highlighted, where(:is_highlight => false)

  validates_uniqueness_of :title

  friendly_id :title, :use => :slugged

end
