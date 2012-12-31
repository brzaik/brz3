class TwitterBoard < ActiveRecord::Base
  attr_accessible :account_name, :block_id, :display_num

  belongs_to :block
end
