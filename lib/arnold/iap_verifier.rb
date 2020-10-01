class Arnold::IAPVerifier
  include Singleton

  PUBLIC_KEY_URL = 'https://www.gstatic.com/iap/verify/public_key'
  AUDIENCE = ENV['IAP_JWT_AUDIENCE']

  def self.verify(header)
    instance.verify(header)
  end

  def verify(assertion)
    a_header = Base64.decode64 assertion.split(".")[0]
    key_id = JSON.parse(a_header)["kid"]

    cert = OpenSSL::PKey::EC.new certificates[key_id]

    info = JWT.decode assertion, cert, true, algorithm: "ES256", audience: AUDIENCE

    info[0]["email"]
  end

  private
  def certificates
    @certificates ||= HTTP.headers('User-Agent' => 'arnold').get(PUBLIC_KEY_URL).parse
  end
end
