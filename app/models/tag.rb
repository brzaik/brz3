class Tag < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :pages

  default_scope order('name ASC')

  scope :public, where(:is_private => false)
  scope :private, where(:is_private => true)
end
