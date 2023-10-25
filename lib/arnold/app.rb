class Arnold::App < Sinatra::Base
  set :views, Arnold.root.join(*%w{lib arnold app views})
  set :public_folder, Arnold.root.join(*%w{lib arnold app public})

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
    erb :index
  end

  get "/healthz" do
    halt 200
  end
end
