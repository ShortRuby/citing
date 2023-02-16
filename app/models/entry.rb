# frozen_string_literal: true

class Entry < ApplicationRecord
	delegated_type :entryable, types: %w[Message Comment]

	validates :url, presence: true
end
