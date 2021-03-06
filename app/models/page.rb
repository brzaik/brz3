class Page < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :description, :is_highlight, :template_id, :title, :tag_ids, :is_private, :upload_id, :is_about_page, :url_link
  attr_accessible :image_attributes

  belongs_to :template
  has_many :sections
  has_one :upload
  has_and_belongs_to_many :tags

  default_scope order('updated_at DESC')

  scope :highlighted, where(:is_highlight => true)
  scope :non_highlighted, where(:is_highlight => false)
  scope :public, where(:is_private => false)
  scope :private, where(:is_private => true)
  scope :about, where(:is_about_page => true)

  validates_uniqueness_of :title

  friendly_id :title, :use => :slugged

end
