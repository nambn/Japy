class AllMigrationHere < ActiveRecord::Migration[5.1]
	def change
		create_table :users do |t|
			t.string  :name, null: false
			t.string  :email, null: false
			t.string  :password_digest, null: false
			t.string  :remember_digest
			t.boolean :admin, default: false
			t.timestamps
			t.index :email, unique: true
		end

		create_table :scores do |t|
			t.belongs_to :user, foreign_key: true, null: false
			t.integer    :value, null: false
			t.timestamps
		end

		create_join_table :users, :books, table_name: :owned_books do |t|
			t.index [:user_id, :book_id]
		end

		create_join_table :users, :vocabs, table_name: :learned_items do |t|
			t.index [:user_id, :vocab_id]
		end
	end
end
