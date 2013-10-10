require 'merchant_e_solutions/detail_record'

module MerchantESolutions
  class BatchDetailReport < Report


    private

    def report_id
      1
    end

    def report_type
      1
    end

    def record_class
      DetailRecord
    end
  end
end
