User.delete_all
User.reset_pk_sequence
User.create!({
	name: 'admin', 
	email: 'admin@japy.com', 
	password: 'wetdog', 
	password_confirmation: 'wetdog', 
	admin: true })

User.create!({
	name: 'emily',
	email: 'emily@japy.com',
	password: 'coldfish',
	password_confirmation: 'coldfish' })

35.times do
	User.create!({
		name: Faker::Name.name, 
		email: Faker::Internet.free_email, 
		password: 'chernobyl', 
		password_confirmation: 'chernobyl' })
end

Score.delete_all
Score.reset_pk_sequence
for i in 10.downto 2
	User.find(2).scores.create!({value: i})
end

OwnedBook.delete_all
User.find(2).owned_books.create!([
	{book_id: '9', buy_time: 30.day.ago},
	{book_id: '10', buy_time: 20.day.ago},
	{book_id: '4', buy_time: 10.day.ago}])

LearnedVocab.delete_all
vocabs = Vocab.pluck(:vocab_id).shuffle[0..14]
for i in 0..14
	LearnedVocab.create!({
		user_id: '2',			 
		vocab_id: vocabs[i],
		learn_time: Faker::Time.backward(15)
		})
end
