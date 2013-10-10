require 'merchant_e_solutions/configuration'
require 'merchant_e_solutions/report'
require 'merchant_e_solutions/request'
require 'merchant_e_solutions/deposit_report'
require 'merchant_e_solutions/batch_detail_report'
require 'merchant_e_solutions/batch_summary_report'
require 'merchant_e_solutions/settlement_detail_report'
require 'merchant_e_solutions/settlement_summary_report'

module MerchantESolutions

  class << self
    def configure
      yield(Configuration)
    end

    def settlement_summary_report(options = {})
      SettlementSummaryReport.new(options)
    end

    def settlement_detail_report(options = {})
      SettlementDetailReport.new(options)
    end
  end

end
