class Video < ActiveRecord::Base
  attr_accessible :title, :type, :url, :videoable_id, :videoable_type

  belongs_to :videoable, :polymorphic => true
end
