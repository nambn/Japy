User.delete_all
User.create({name: 'admin', email: 'admin@japy.com', password: 'wetdog', password_confirmation: 'wetdog', admin: true})
User.create({name: 'emily', email: 'emily@japy.com', password: 'coldfish', password_confirmation: 'coldfish'})
69.times do
	User.create({name: Faker::Name.name, email: Faker::Internet.free_email, password: 'chernobyl', password_confirmation: 'chernobyl'})
end

Score.delete_all
for i in (10).downto(2)
	User.find(2).scores.create({value: i})
end