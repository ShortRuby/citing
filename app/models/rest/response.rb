# frozen_string_literal: true

module Rest
	Response = Data.define(
		:body,
		:headers,
		:parsed_body,
		:status
	)
end
