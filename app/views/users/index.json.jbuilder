json.result true
json.data do
	json.array! @users, :id, :name, :email, :admin, :created_at
end