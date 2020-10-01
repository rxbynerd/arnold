require 'spec_helper'

RSpec.describe Arnold::App, type: :app do
  describe 'GET /healthz' do
    it 'returns an HTTP 200 code' do
      get '/healthz'

      expect(last_response).to be_ok
    end
  end
end
