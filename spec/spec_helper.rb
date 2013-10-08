require 'merchant_e_solutions'
require 'pry'

MerchantESolutions.configure do |config|
  config.user_id = "testUserID"
  config.password = "testPassword"
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

module Net
  class HTTP
    def request(*args)
      raise "Requests should be stubbed out during tests."
    end
  end
end

def stub_net_http_requests
  Net::HTTP.any_instance.stub(request: double(:request, body: "Nice body!"))
end
