class Book < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

end
