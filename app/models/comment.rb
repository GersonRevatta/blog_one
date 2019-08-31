class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, length: {minimum: 3}
  def owner_user(session)
    self.user == session
  end
end
