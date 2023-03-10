class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  validates :user_id, presence: true
end
