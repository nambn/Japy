class User < ApplicationRecord
	has_many :owned_books
	has_many :books, through: :owned_books
	has_many :scores
	has_many :learned_vocabs
	has_many :vocabs, through: :learned_vocabs
end
