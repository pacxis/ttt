class Book < ApplicationRecord
    # resourcify
    belongs_to :author
    has_many :book_genres
    has_many :genres, through: :book_genres

    has_one_attached :cover

    validates :title, presence: true, length: { minimum: 3 }
end
