class Section < ActiveRecord::Base
  attr_accessible :page_id, :position, :additional_styles, :additional_tags, :title
  default_scope order('position ASC')

  belongs_to :page
  has_many :rows
end
