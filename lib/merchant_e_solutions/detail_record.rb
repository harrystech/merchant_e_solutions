require 'merchant_e_solutions/record'

module MerchantESolutions
  class DetailRecord < Record

    attr_reader :organization_id, :organization_name, :term_number, :batch_number, :batch_date,
      :transaction_date, :card_code, :card_number, :purchase_id, :auth_code,
      :entry_mode, :transaction_amount, :trident_transaction_id, :client_reference_number

    def initialize(row)
      @organization_id = row["Merchant Id"]
      @organization_name = row["DBA Name"]
      @term_number = row["Term Num"]
      @batch_number = row["Batch Num"]
      @batch_date = parse_date(row["Batch Date"])
      @transaction_date = parse_date(row["Tran Date"])
      @card_code = row["Card Type"]
      @card_number = row["Card Number"]
      @reference_number = row["Reference"]
      @purchase_id = row["Purchase Id"]
      @auth_code = row["Auth Code"]
      @entry_mode = row["Entry Mode"]
      @transaction_amount = row["Tran Amount"]
      @trident_transaction_id = row["Trident Tran Id"]
      @client_reference_number = row["Client Ref Num"]
    end

    def reference_number(options={})
      return @reference_number if options[:unchanged]
      cleaned_reference_number
    end

    def purchase_id(options={})
      return @purchase_id if options[:unchanged]
      cleaned_purchase_id
    end

    def credit_company
      {
        "AM" => "American Express",
        "DS" => "Discover",
        "MB" => "MasterCard",
        "MC" => "MasterCard",
        "MD" => "MasterCard",
        "VB" => "Visa",
        "VD" => "Visa",
        "VS" => "Visa",
      }.fetch(card_code, card_code)
    end

    def credit_type
      if ["MC", "VS", "AM", "DS"].include? card_code
        "Credit"
      elsif ["MD", "VD"].include? card_code
        "Debit"
      elsif ["MB", "VB"].include? card_code
        "Business"
      end
    end


    private

    def cleaned_reference_number
      if @reference_number.start_with?("'")
        @reference_number[1..-1]
      else
        @reference_number
      end
    end

    def cleaned_purchase_id
      @purchase_id.strip
    end
  end
end
