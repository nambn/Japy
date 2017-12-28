class LearnedVocab < ApplicationRecord
	belongs_to :vocab
	belongs_to :user
end
