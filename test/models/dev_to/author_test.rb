# frozen_string_literal: true

require "test_helper"

class DevTo::AuthorTest < ActiveSupport::TestCase
	test "author is valid with name, original_unique_id and website_url" do
		dev_to_author = DevTo::Author.new(
			name: "A",
			original_unique_id: SecureRandom.uuid,
			website_url: "https://example.com/author"
		)

		assert_predicate(
			dev_to_author,
			:valid?,
			"Model should be valid but found: #{dev_to_author.errors.full_messages.join(', ')}"
		)
	end
end
