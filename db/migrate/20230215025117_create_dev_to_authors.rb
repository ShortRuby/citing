# frozen_string_literal: true

class CreateDevToAuthors < ActiveRecord::Migration[7.0]
	def change
		create_table :dev_to_authors do |t|
			t.string :username
			t.string :original_unique_id
			t.string :name
			t.string :summary
			t.string :website_url
			t.string :profile_image_url
			t.string :twitter_username
			t.string :github_username
			t.json :data
			t.timestamps
		end
	end
end
