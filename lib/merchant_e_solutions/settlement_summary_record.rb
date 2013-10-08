module MerchantESolutions
  class SettlementSummaryRecord

    attr_reader :organization_id, :organization_name, :card_type,
      :sales_count, :sales_amount, :credits_count, :credits_amount, :net_amount

    def initialize(row)
      @organization_id = row[0]
      @organization_name = row[1]
      @card_type = row[2]
      @sales_count = row[3]
      @sales_amount = row[4]
      @credits_count = row[5]
      @credits_amount = row[6]
      @net_amount = row[7]
    end
  end
end
