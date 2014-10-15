class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, polymorphic: true

  validates :user_id, presence: true

  belongs_to :user

  def body=(new_body)
    self[:body]=(new_body.upcase)
  end
end
