class Arnold::App < Sinatra::Base
  set :public_folder, Arnold.root.join(*%w{lib arnold app public})
  set :views, Arnold.root.join(*%w{lib arnold app views})

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
    # "arnold (#{Arnold::Feature.count} features)"
    erb :react
  end

  get "/healthz" do
    halt 200
  end
end
