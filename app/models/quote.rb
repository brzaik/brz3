class Quote < ActiveRecord::Base
  attr_accessible :author, :concatenated_quote, :quote, :quoteable_id, :quoteable_type
end
