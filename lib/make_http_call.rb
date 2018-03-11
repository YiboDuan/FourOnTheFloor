class MakeHttpCall
  include Verbalize::Action

  input :base_url, :path, :http_method, :payload

  def call
    response = make_request
    body = JSON.parse(response.body).try(:deep_symbolize_keys)

    if (400..599).cover?(response.status)
      fail!(body)
    end

    body
  end

  private

  def make_request
    case http_method
    when :get
      connection.get(path.chomp('/')) do |request|
        if payload
          request.params = payload
        end
      end
    when :post
      connection.post do |request|
        request.url path.chomp('/')
        request.body = payload.try(:to_json)
        request.headers['Content-Type'] = 'application/json'
      end
    else
      fail!('unsupported http method')
    end
  end

  def connection
    Faraday.new(:url => base_url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end