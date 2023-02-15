# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[7.0]
	def change
		create_table :entries do |t|
			t.string :url, null: false
			t.string :entryable_type, null: false
			t.integer :entryable_id, null: false
			t.timestamps
		end

		add_index :entries, :url
		add_index :entries, [:entryable_type, :entryable_id]
	end
end
