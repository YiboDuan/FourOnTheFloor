require_dependency 'env'

module OAuth
  class RequestAccessToken
    include Verbalize::Action

    INSTAGRAM_ACCESS_TOKEN_URL = 'https://api.instagram.com'

    input :code

    def call
      conn = Faraday.new(:url => INSTAGRAM_ACCESS_TOKEN_URL) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      params = {
        client_id: Env.client_id,
        client_secret: '5a84c53cb65a416abf8e1f73250ed71e',
        grant_type: 'authorization_code',
        redirect_uri: Env.instagram_redirect_url,
        code: code
      }

      conn.post '/oauth/access_token', params
    end
  end
end
