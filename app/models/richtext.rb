class Richtext < ActiveRecord::Base
  attr_accessible :block_id, :content

  belongs_to :block
end
