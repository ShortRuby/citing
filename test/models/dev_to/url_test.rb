# frozen_string_literal: true

require "test_helper"

class DevTo::UrlTest < ActiveSupport::TestCase
	test "it returns the correct username" do
		initial_url = "https://dev.to/author_name/article-slug"
		dev_to_url = DevTo::Url.new(initial_url)

		assert_equal "author_name", dev_to_url.username
	end
end
