class Block < ActiveRecord::Base
  attr_accessible :column_id, :content_name, :position, :additional_styles, :additional_tags
  attr_accessible :richtext_attributes
  attr_accessible :orbit_attributes
  attr_accessible :video_attributes
  attr_accessible :image_attributes
  attr_accessible :link_attributes
  attr_accessible :quote_attributes
  attr_accessible :twitter_board_attributes
  default_scope order('position ASC')

  belongs_to :column
  
  has_one :richtext, :dependent => :destroy
  has_one :orbit, :dependent => :destroy
  has_one :twitter_board, :dependent => :destroy

  has_one :video, :as => :videoable, :dependent => :destroy
  has_one :quote, :as => :quoteable, :dependent => :destroy
  has_one :image, :as => :imageable, :dependent => :destroy
  has_one :link, :as => :linkable, :dependent => :destroy
  
  accepts_nested_attributes_for :richtext
  accepts_nested_attributes_for :orbit
  accepts_nested_attributes_for :video
  accepts_nested_attributes_for :image
  accepts_nested_attributes_for :twitter_board
  accepts_nested_attributes_for :link
  accepts_nested_attributes_for :quote
end
