# frozen_string_literal: true

require "test_helper"

class EntryTest < ActiveSupport::TestCase
	test "can create delegated type" do
		dev_to_article = dev_to_articles(:one)
		entry = Entry.create(
			entryable: dev_to_article,
			url: "https://newsletter.shortruby.com"
		)

		assert_predicate(
			entry,
			:persisted?,
			"Entry cannot be saved due to the following errors: #{entry.errors.full_messages.join(', ')}"
		)
	end
end
