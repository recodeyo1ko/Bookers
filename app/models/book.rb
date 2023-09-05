class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  acts_as_taggable_on :tags

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "title", "updated_at", "user_id", "tag_list"]
  end
  
   def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
   end
end
