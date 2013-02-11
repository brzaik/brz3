class Image < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type, :upload_id, :caption, :position, :url_link, :include_border
  default_scope order('position ASC')

  has_one :upload

  belongs_to :imageable, :polymorphic => true
end
