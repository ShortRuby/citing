# frozen_string_literal: true

class CreateDevToArticles < ActiveRecord::Migration[7.0]
	def change
		create_table :dev_to_articles do |t|
			t.string :title, null: false
			t.string :description, null: true
			t.datetime :published_at, null: false
			t.integer :dev_to_author_id, null: true
			t.json :data
			t.timestamps
		end

		add_index :dev_to_articles, :title
	end
end
