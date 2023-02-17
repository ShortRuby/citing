# frozen_string_literal: true

module DevTo
	class Client < Rest::Client
		AUTHORIZATION_HEADER_KEY = "api-key"
		DEFAULT_API_URL = "https://dev.to/api"
		ACCEPT_HEADER = "application/vnd.forem.api-v1+json"

		def initialize(api_key = ENV.fetch("DEV_TO_API_KEY"))
			@api_key = api_key
			super(base_url: DEFAULT_API_URL)
		end

		def user(username:)
			path = -"/users/by_username"
			query_params = { url: username }

			get(path, headers:, query_params:)
		end

		private

		attr_reader :api_key

		def headers
			{
				"User-Agent": Rest::Client::USER_AGENT,
				"accept": ACCEPT_HEADER,
				"api-key": api_key,
			}
		end
	end
end
