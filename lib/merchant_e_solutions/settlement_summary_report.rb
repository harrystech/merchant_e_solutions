require 'csv'

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
      SettlementSummaryRecord
    end
  end
end
