# frozen_string_literal: true

module Entryable
	extend ActiveSupport::Concern

	included do
		has_one :entry, as: :entryable, dependent: :destroy, touch: true
	end
end
