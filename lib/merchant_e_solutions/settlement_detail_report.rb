require 'csv'

module MerchantESolutions
  class SettlementDetailReport < Report


    private

    def report_id
      2
    end

    def report_type
      1
    end

    def record_class
      SettlementDetailRecord
    end
  end
end
