require 'merchant_e_solutions/request'
require 'merchant_e_solutions/settlement_report'

module MerchantESolutions
  def self.settlement_report(options = {})
    SettlementReport.new(options)
  end
end
