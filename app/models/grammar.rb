class Grammar < ApplicationRecord
	belongs_to :book
	has_many :learned_grammars
	has_many :users, through: :learned_grammars
end
