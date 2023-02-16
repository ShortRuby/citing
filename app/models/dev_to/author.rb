# frozen_string_literal: true

class DevTo::Author < ApplicationRecord
	has_many(
		:articles,
		class_name: "DevTo::Article",
		dependent: :destroy,
		foreign_key: "dev_to_author_id",
		inverse_of: :author
	)

	validates :name, presence: true
	validates :website_url, presence: true
	validates :original_unique_id, presence: true
end
