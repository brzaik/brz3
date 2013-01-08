class Block < ActiveRecord::Base
  attr_accessible :section_id, :content_name, :position, :additional_styles, :additional_tags
  attr_accessible :richtext_attributes
  attr_accessible :video_attributes
  attr_accessible :image_attributes
  attr_accessible :twitter_board_attributes
  default_scope order('position ASC')

  belongs_to :section
  
  has_one :richtext, :dependent => :destroy
  has_one :video, :as => :videoable, :dependent => :destroy
  has_one :image, :as => :imageable, :dependent => :destroy
  has_one :twitter_board, :dependent => :destroy
  has_one :link, :dependent => :destroy
  has_one :quote, :dependent => :destroy

  accepts_nested_attributes_for :richtext
  accepts_nested_attributes_for :video
  accepts_nested_attributes_for :image
  accepts_nested_attributes_for :twitter_board
  accepts_nested_attributes_for :link
  accepts_nested_attributes_for :quote
end
