require_dependency 'env'

module OAuth
  class BuildFacebookLoginUrl
    include Verbalize::Action

    input :state_param

    def call
      'https://www.facebook.com/v2.12/dialog/oauth?'\
      "client_id=#{facebook_app_id}"\
      "&redirect_uri=#{redirect_uri}"\
      "&state=#{state_param}"
    end

    private

    def facebook_app_id
      Env.facebook_app_id
    end

    def redirect_uri
      Env.facebook_redirect_url
    end
  end
end
