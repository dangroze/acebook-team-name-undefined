class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :message, presence: true, length: { minimum: 4 }
end
