User.delete_all
User.create({name: 'admin', email: 'admin@japy.com', password: 'wetdog', password_confirmation: 'wetdog', admin: true})
User.create({name: 'emily', email: 'emily@japy.com', password: 'coldfish', password_confirmation: 'coldfish'})
69.times do
	User.create({name: Faker::Name.name, email: Faker::Internet.free_email, password: 'chernobyl', password_confirmation: 'chernobyl'})
end

for i in 10..1
	User.find(2).scores.create({user_id: 2, value: i})
end