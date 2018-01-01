Before routes:  /JPweb-be

Method | Routes | Note
---|---|---
GET | /books | [get all books](doc/list-all-books.txt)
GET | /books/:id | [get book has id = :id](doc/)
GET | /books/:id/units | [get all units in book has id = :id](doc/)
GET | /books/:id/vocabs | [get all vocabs in book has id = :id](doc/)
GET | /books/:id/:unit/vocabs | [get all vocabs in book has id = :id where unit = :unit](doc/)
GET | /books/:id/grammars | [get all grammars in book has id = :id](doc/)
GET | /books/:id/:unit/grammars | [get all grammars in book has id = :id where unit = :unit](doc/)
GET | /users | [get all users](doc/list-all-users.txt)
GET | /users/:id | [get user with id = :id](doc/get-user-2.txt)
POST | /users | [create a new user](doc/create-new-user.txt) ( [if failed](doc/create-user-failed.txt) )
PATCH | /users/:id | [update user has id = :id](doc/)
DELETE | /users/:id | [delete user has id = :id](doc/delete-last-user.txt)
GET | /users/:id/books | [get all books user with :id has bought](doc/)
GET | /users/:id/vocabs | [get all vocabs user with :id has learnt](doc/)
GET | /users/:id/grammars | [get all grammars user with :id has learnt](doc/)