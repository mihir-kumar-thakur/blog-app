class Post < ApplicationRecord
  belongs_to :user

  enum status: { draft: 0, published: 1, archived: 2 }

  validates :title, presence: true #, length: { minimum: 10 }
  validates :body, presence: true #, length: { minimum: 100 }
end
