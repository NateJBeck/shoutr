class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, polymorphic: true

  validates :body, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
