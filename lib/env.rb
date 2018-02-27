class Env
    def swagger_url
        ENV['SWAGGER_URL'] || 'http://localhost:3000'
    end
end