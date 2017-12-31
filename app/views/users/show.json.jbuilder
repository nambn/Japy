json.result true
json.data do
	json.merge! @user.attributes
	json.onwed_books @user.owned_books do |b|
		json.book_id b.book_id
		json.buy_time b.buy_time
	end
	json.learned_vocabs @user.learned_vocabs do |v|
		json.vocab_id v.vocab_id
		json.learn_time v.learn_time
	end
end