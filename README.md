Before routes:  /JPweb-be

Method | Routes | Note
---|---|---
GET | /books | [get all books](get-a-user.txt)
GET | /books/:id | [get book has id = :id]()
GET | /books/:id/units | [get all units in book has id = :id]()
GET | /books/:id/vocabs | [get all vocabs in book has id = :id]()
GET | /books/:id/:unit/vocabs | [get all vocabs in book has id = :id where unit = :unit]()
GET | /books/:id/grammars | [get all grammars in book has id = :id]()
GET | /books/:id/:unit/grammars | [get all grammars in book has id = :id where unit = :unit]()
GET | /users | [get all users]()
GET | /users/:id | [get user with id = :id]()
POST | /users | [create a new user]()
PATCH | /users/:id | [update user has id = :id]()
DELETE | /users/:id | [delete user has id = :id]()
GET | /users/:id/books | [get all books user with :id has bought]()
GET | /users/:id/vocabs | [get all vocabs user with :id has learnt]()
GET | /users/:id/grammars | [get all grammars user with :id has learnt]()