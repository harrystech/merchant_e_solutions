require 'merchant_e_solutions/configuration'
require 'merchant_e_solutions/request'
require 'merchant_e_solutions/settlement_record'
require 'merchant_e_solutions/settlement_report'
require 'merchant_e_solutions/settlement_detail_report'
require 'merchant_e_solutions/settlement_detail_record'

module MerchantESolutions

  class << self
    def configure
      yield(Configuration)
    end

    def settlement_report(options = {})
      SettlementReport.new(options)
    end

    def settlement_detail_report(options = {})
      SettlementDetailReport.new(options)
    end
  end

end
