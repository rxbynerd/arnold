class Arnold::App < Sinatra::Base
  before do
    return if request.path == "/healthz"

    if Arnold.env.development?
      @email = 'development@ghostworks.dev'

      return
    end

    begin
      @email = Arnold::IAPVerifier.verify(request.env["HTTP_X_GOOG_IAP_JWT_ASSERTION"])
    rescue
      halt 401
    end
  end

  get "/" do
    "arnold (#{Arnold::Feature.count} features)"
  end

  get "/healthz" do
    halt 200
  end
end
