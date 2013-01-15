class Row < ActiveRecord::Base
  attr_accessible :section_id, :position, :additional_styles, :additional_tags
  default_scope order('position ASC')

  belongs_to :section
  has_many :columns
end
