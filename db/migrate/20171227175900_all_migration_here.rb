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
			t.references :user, foreign_key: {on_delete: :cascade}, null: false
			t.integer :value, null: false
			t.timestamps
		end

		create_join_table :users, :books, table_name: :owned_books do |t|
			t.references :user, foreign_key: {on_delete: :cascade}, null: false
			t.datetime :buyed_time
			t.index [:user_id, :book_id], unique: true
		end

		add_foreign_key :owned_books, :books, column: :book_id, on_delete: :cascade

		create_join_table :users, :vocabs, table_name: :learned_vocabs do |t|
			t.references :user, foreign_key: {on_delete: :cascade}, null: false
			t.datetime :learned_time
			t.index [:user_id, :vocab_id], unique: true
		end

		add_foreign_key :learned_vocabs, :vocabs, column: :vocab_id, on_delete: :cascade
	end
end
