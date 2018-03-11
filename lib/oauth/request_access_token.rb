require_dependency 'oauth/build_facebook_token_request_payload'
require_dependency 'make_http_call'

module OAuth
  class RequestAccessToken
    include Verbalize::Action

    input :code

    def call
      payload = BuildFacebookTokenRequestPayload.call!(code: code)

      MakeHttpCall.call!(
        base_url: payload[:base_url],
        path: payload[:path],
        http_method: :get,
        payload: payload[:params]
      )
    end
  end
end
