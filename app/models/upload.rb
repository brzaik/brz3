class Upload < ActiveRecord::Base
  attr_accessible :myfile

  has_many :images

  has_attached_file :myfile, :styles => { :full => "1000x700>", :medium => "300x300>", :thumb => "80x64#" }
end
