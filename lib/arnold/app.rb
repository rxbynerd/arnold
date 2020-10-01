class Arnold::App < Sinatra::Base
  before do
    return if request.path == "/healthz"

    begin
      @email = Arnold::IAPVerifier.verify(request.env["HTTP_X_GOOG_IAP_JWT_ASSERTION"])
    rescue
      halt 401
    end
  end

  get "/" do
    "arnold"
  end

  get "/healthz" do
    halt 200
  end
end
