require 'merchant_e_solutions/record'

module MerchantESolutions
  class DepositRecord < Record

    attr_reader :organization_id, :organization_name,
      :date, :type, :amount, :reference_id

    def initialize(row)
      @organization_id = row[0]
      @organization_name = row[1]
      @date = parse_date(row[2])
      @type = row[3]
      @amount = row[4]
      @reference_id = row[5]
    end
  end
end
