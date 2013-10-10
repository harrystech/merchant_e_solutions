require 'merchant_e_solutions/deposit_record'

module MerchantESolutions
  class DepositReport < Report


    private

    def report_id
      3
    end

    def report_type
      1
    end

    def record_class
      DepositRecord
    end
  end
end
