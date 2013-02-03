class Orbit < ActiveRecord::Base
  attr_accessible :block_id

  belongs_to :block
  has_many :images, :as => :imageable, :dependent => :destroy
end
