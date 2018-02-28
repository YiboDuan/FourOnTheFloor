module Api
  class NotFoundApi < Grape::API
    format :json
    default_format :json

    route :any, '*path' do
      error!({ error: 'Not Found',
               message: "No such route '#{request.path}'",
               status: '404' },
             404)
    end
  end
end