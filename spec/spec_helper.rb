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
