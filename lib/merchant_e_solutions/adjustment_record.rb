require 'merchant_e_solutions/record'

module MerchantESolutions
  class AdjustmentRecord < Record

    attr_reader :organization_id, :organization_name, :control_number, :incoming_date,
      :card_number, :reference_id, :transaction_date, :transaction_amount,
      :authorization_code, :adjustment_date, :adjustment_reference_number,
      :reason, :first_time, :reason_code, :cb_reference_number, :terminal_id


    def initialize(row)
      @organization_id = row[0]
      @organization_name = row[1]
      @control_number = row[2]
      @incoming_date = parse_date(row[3])
      @card_number = row[4]
      @reference_id = row[5]
      @transaction_date = parse_date(row[6])
      @transaction_amount = row[7]
      @authorization_code = row[8]
      @adjustment_date = parse_date(row[9])
      @adjustment_reference_number = row[10]
      @reason = row[11]
      @first_time = parse_boolean(row[12])
      @reason_code = row[13]
      @cb_reference_number = row[14]
      @terminal_id = row[15]
    end
  end
end
