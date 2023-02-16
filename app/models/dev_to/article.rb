# frozen_string_literal: true

class DevTo::Article < ApplicationRecord
	include Entryable

	belongs_to(
		:author,
		class_name: "DevTo::Author",
		foreign_key: "dev_to_author_id",
		inverse_of: :articles,
		optional: true
	)

	validates :title, presence: true
	validates :published_at, presence: true
end
