class LearnedGrammar < ApplicationRecord
	belongs_to :grammar
	belongs_to :user
end
