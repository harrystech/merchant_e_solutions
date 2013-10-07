require 'merchant_e_solutions/configuration'
require 'merchant_e_solutions/request'
require 'merchant_e_solutions/settlement_report'

module MerchantESolutions

  class << self
    def configure
      yield(Configuration)
    end

    def settlement_report(options = {})
      SettlementReport.new(options)
    end
  end

end
