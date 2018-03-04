class Env
  class << self
    def swagger_url
      ENV['SWAGGER_URL'] || 'http://localhost:3000'
    end

    def client_id
      ENV['CLIENT_ID']
    end

    def instagram_redirect_url
      ENV['INSTAGRAM_REDIRECT_URL'] || 'http://localhost:3000/instagram_redirect'
    end
  end
end
