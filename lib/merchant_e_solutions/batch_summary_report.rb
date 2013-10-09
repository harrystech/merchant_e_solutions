require 'csv'

module MerchantESolutions
  class BatchSummaryReport < Report


    private

    def report_id
      1
    end

    def report_type
      0
    end

    def record_class
      BatchSummaryRecord
    end
  end
end
