module MerchantESolutions
  class DepositRecord

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


    private

    def parse_date(date)
      Date.strptime(date, "%m/%d/%Y") if date
    end
  end
end
