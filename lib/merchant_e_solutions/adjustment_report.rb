require 'merchant_e_solutions/adjustment_record'

module MerchantESolutions
  class AdjustmentReport < Report


    private

    def report_id
      5
    end

    def report_type
      1
    end

    def record_class
      AdjustmentRecord
    end
  end
end
