require_dependency 'env'

module OAuth
  class BuildFacebookTokenRequestPayload
    include Verbalize::Action

    input :code

    def call
      {
        base_url: 'https://graph.facebook.com',
        path: '/v2.12/oauth/access_token?',
        params: {
          client_id: facebook_app_id,
          redirect_uri: redirect_uri,
          client_secret: facebook_app_secret,
          code: code
        }
      }
    end

    private

    def facebook_app_id
      Env.facebook_app_id
    end

    def facebook_app_secret
      Env.facebook_app_secret
    end

    def redirect_uri
      Env.facebook_redirect_url
    end
  end
end
