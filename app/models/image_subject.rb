class ImageSubject < ActiveRecord::Base
  validates :url, presence: true
  validates :caption, presence: true
end
