class Upload < ActiveRecord::Base
  attr_accessible :myfile

  has_many :images

  has_attached_file :myfile, :styles => { :full => "986x500>", :frontpage => "480x260#", :small => "228x150#", :thumb => "80x64#" }
end
