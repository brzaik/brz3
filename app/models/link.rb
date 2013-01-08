class Link < ActiveRecord::Base
  attr_accessible :caption, :linkable_id, :linkable_type, :title, :url
end
