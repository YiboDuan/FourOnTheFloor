require_dependency 'env'

module OAuth
  class AssembleAccessCodeUrl
    include Verbalize::Action

    def call
      "https://api.instagram.com/oauth/authorize/?client_id=#{client_id}&redirect_uri=#{redirect_uri}&response_type=code"
    end

    private

    def client_id
      Env.client_id
    end

    def redirect_uri
      Env.instagram_redirect_url
    end
  end
end
