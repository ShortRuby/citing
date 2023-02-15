# frozen_string_literal: true

class DevTo::Article < ApplicationRecord
	include Entryable

	validates :title, presence: true
	validates :published_at, presence: true
end
