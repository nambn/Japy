rm doc/*.txt

curl http://localhost:3000/JPweb-be/users | jq '.' > doc/list-all-users.txt

curl http://localhost:3000/JPweb-be/users/2 | jq '.' > doc/get-user-2.txt

curl http://localhost:3000/JPweb-be/users \
-X POST \
-H "Accept: application/json" \
-H "Content-type: application/json" \
-d '{"user":{"name":"bluesnail","email":"bluey@snailey.com",
"password":"wetshell","password_confirmation":"wetshell"}}' \
 | jq '.' > doc/create-new-user.txt

curl http://localhost:3000/JPweb-be/users \
-X POST \
-H "Accept: application/json" \
-H "Content-type: application/json" \
-d '{"user":{"name":"12345","email":"example@invalid",
"password":"hotpaper","password_confirmation":"coldpaper"}}' \
 | jq '.' > doc/create-user-failed.txt

ULID="$(curl http://localhost:3000/JPweb-be/u/last)"

curl http://localhost:3000/JPweb-be/users/"${ULID}" \
-X DELETE \
-H "Accept: application/json" | jq '.' > doc/delete-last-user.txt

curl http://localhost:3000/JPweb-be/books | jq '.' > doc/list-all-books.txt
