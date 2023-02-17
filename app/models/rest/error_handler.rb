# frozen_string_literal: true

module Rest
	class UnauthenticatedError < StandardError; end
	class BadRequestError < StandardError; end
	class ServerError < StandardError; end
	class GenericError < StandardError; end

	class ErrorHandler
		def initialize(url:, response:)
			@url = url
			@response = response
		end

		def parse
			return if response.code == 200

			case response.code
			when 401
				Rails.logger.error("Unauthenticated! requested URL: #{url} response: #{response.body}")
				raise UnauthenticatedError
			when 400
				Rails.logger.error("Invalid request: requested URL: #{url} response: #{response.body}")
				raise BadRequestError
			when 500..599
				Rails.logger.error("Server error: requested URL: #{url} response: #{response.body}")
				raise ServerError
			else
				Rails.logger.error("Generic error: requested URL: #{url} response: #{response.body}")
				raise GenericError
			end
		end

		private

		attr_reader :url, :response
	end
end
