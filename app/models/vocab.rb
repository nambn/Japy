class Vocab < ApplicationRecord
	belongs_to :book
	has_many :learned_vocabs
	has_many :users, through: :learned_vocabs
end
