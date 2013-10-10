module MerchantESolutions
  class BatchDetailRecord

    attr_reader :organization_id, :organization_name, :term_number, :batch_number, :batch_date,
      :transaction_date, :card_code, :card_number, :reference_number, :purchase_id, :auth_code,
      :entry_mode, :transaction_amount, :trident_transaction_id, :client_reference_number

    def initialize(row)
      @organization_id = row[0]
      @organization_name = row[1]
      @term_number = row[2]
      @batch_number = row[3]
      @batch_date = parse_date(row[4])
      @transaction_date = parse_date(row[5])
      @card_code = row[6]
      @card_number = row[7]
      @reference_number = row[8]
      @purchase_id = row[9]
      @auth_code = row[10]
      @entry_mode = row[11]
      @transaction_amount = row[12]
      @trident_transaction_id = row[13]
      @client_reference_number = row[14]
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

    def parse_date(date)
      Date.strptime(date, "%m/%d/%Y") if date
    end
  end
end
