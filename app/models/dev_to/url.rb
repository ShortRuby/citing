# frozen_string_literal: true

module DevTo
	class Url
		DEV_TO_HOST = "dev.to"

		delegate :to_s, to: :url

		def self.valid?(url)
			uri = URI.parse(url)

			uri.host == DEV_TO_HOST
		end

		def initialize(original_url)
			@original_url = original_url
			@url = URI.parse(original_url)
		end

		def username = @_username ||= url.path.delete_prefix("/").split("/")&.first

		private

		attr_reader :url
	end
end
