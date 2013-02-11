class Upload < ActiveRecord::Base
  attr_accessible :myfile

  has_many :images

  has_attached_file :myfile, :styles => { :full => "986x400#", :orbit => "980x500#", :frontpage => "480x260#", :smproj => "228x150#", :thumb => "80x64#" }
end
