# frozen_string_literal: true

module Rest
	class Client
		USER_AGENT = "ShortRubyClient"

		def initialize(base_url:)
			@api_url = URI.parse(base_url)
		end

		def get(path, headers: {}, query_params: {})
			request(:get, path:, query_params:)
		end

		private

		attr_reader :api_url

		def request(method, path:, headers: {}, query_params: {})
			url = request_uri(path:, query_params:)
			request = Typhoeus::Request.new(url.to_s, headers:, method:)

			begin
				run(request)
					.then { handle_errors(response: _1, url:) }
					.then { api_response(_1) }
			rescue StandardError => e
				Rails.logger.error(e)
			end
		end

		def request_uri(path:, query_params:)
			url = api_url.dup
			url.path += path
			url.query = query_params.to_query unless query_params.empty?

			url
		end

		def run(request)
			hydra = Typhoeus::Hydra.hydra
			hydra.queue(request)
			hydra.run

			request.response
		end

		def handle_errors(response:, url:)
			ErrorHandler.new(response:, url:).parse

			response
		end

		def api_response(response)
			Response.new(
				body: response.body,
				headers: response.headers,
				parsed_body: JSON.parse(response.body, symbolize_names: true),
				status: response.code
			)
		end
	end
end
