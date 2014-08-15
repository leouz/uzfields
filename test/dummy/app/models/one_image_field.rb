class OneImageField < ActiveRecord::Base
  attr_accessible :image_field  
  mount_uploader :image_field, ImageFieldUploader
end
