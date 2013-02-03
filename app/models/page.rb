class Page < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :description, :is_highlight, :template_id, :title, :meta_description, :tag_ids, :is_private, :upload_id
  attr_accessible :image_attributes

  belongs_to :template
  has_many :sections
  has_one :upload
  has_and_belongs_to_many :tags

  default_scope order('updated_at DESC')

  scope :highlighted, where(:is_highlight => true)
  scope :non_highlighted, where(:is_highlight => false)
  scope :public, where(:is_private => false)

  validates_uniqueness_of :title

  friendly_id :title, :use => :slugged

end
