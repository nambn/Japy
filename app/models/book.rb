class Book < ApplicationRecord
	has_many :vocabs
	has_many :grammars
	has_many :owned_books
	has_many :users, through: :owned_books
end
