require 'merchant_e_solutions/record'

module MerchantESolutions
  class AdjustmentRecord < Record

    attr_reader :organization_id, :organization_name, :control_number, :incoming_date,
      :card_number, :reference_id, :transaction_date, :transaction_amount, :trident_transaction_id,
      :purchase_id, :client_reference_number, :authorization_code, :adjustment_date, :adjustment_reference_number,
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
      @trident_transaction_id = row[8]
      @purchase_id = row[9]
      @client_reference_number = row[10]
      @authorization_code = row[11]
      @adjustment_date = parse_date(row[12])
      @adjustment_reference_number = row[13]
      @reason = row[14]
      @first_time = parse_boolean(row[15])
      @reason_code = row[16]
      @cb_reference_number = row[17]
      @terminal_id = row[18]
    end
  end
end
