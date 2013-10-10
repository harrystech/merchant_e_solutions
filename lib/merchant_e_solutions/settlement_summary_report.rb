require 'merchant_e_solutions/summary_record'

module MerchantESolutions
  class SettlementSummaryReport < Report


    private

    def report_id
      2
    end

    def report_type
      0
    end

    def record_class
      SummaryRecord
    end
  end
end
