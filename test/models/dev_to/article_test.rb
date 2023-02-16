# frozen_string_literal: true

require "test_helper"

class DevTo::ArticleTest < ActiveSupport::TestCase
	test "article is valid with title and published_at" do
		author = dev_to_authors(:kai)
		dev_to_article = DevTo::Article.new(
			author:,
			published_at: 1.day.ago,
			title: "This is my first article"
		)

		assert_predicate(
			dev_to_article,
			:valid?,
			"Model should be valid but found: #{dev_to_article.errors.full_messages.join(', ')}"
		)
	end
end
