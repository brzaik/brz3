class Column < ActiveRecord::Base
  attr_accessible :page_id, :position, :span_width, :clear, :additional_styles, :additional_tags
  default_scope order('position ASC')

  belongs_to :row
  has_many :blocks
end
