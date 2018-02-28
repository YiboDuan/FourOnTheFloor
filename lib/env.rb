class Env
    class << self
        def swagger_url
            ENV['SWAGGER_URL'] || 'http://localhost:3000'
        end

        def temp_client_id
            ENV['CLIENT_ID']
        end
    end
end