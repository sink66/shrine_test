class User < ApplicationRecord
  include ImageUploader::Attachment(:image) 
end
