class Env
  class << self
    def swagger_url
      ENV['SWAGGER_URL'] || 'http://localhost:3000'
    end

    def facebook_app_id
      ENV['FACEBOOK_APP_ID']
    end

    def facebook_app_secret
      ENV['FACEBOOK_APP_SECRET']
    end

    def facebook_redirect_url
      ENV['FACEBOOK_REDIRECT_URL'] || 'http://localhost:3000/facebook_redirect'
    end
  end
end
