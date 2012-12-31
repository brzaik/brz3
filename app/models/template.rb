class Template < ActiveRecord::Base
  attr_accessible :template_name

  has_many :pages
end
