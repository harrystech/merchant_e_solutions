require 'spec_helper'

describe MerchantESolutions::SettlementRecord do
  describe "#initialize" do
    let(:csv_row) { ['42', "Hamazon", "Visa", 1337, 1000000000.0, 1, 0.01, 999999999.99] }
    it "puts all of the data into appropriate fields" do
      record = MerchantESolutions::SettlementRecord.new(csv_row)

      record.organization_id.should == '42'
      record.organization_name.should == "Hamazon"
      record.card_type.should == "Visa"
      record.sales_count.should == 1337
      record.sales_amount.should == 1000000000.0
      record.credits_count.should == 1
      record.credits_amount.should == 0.01
      record.net_amount.should == 999999999.99
    end
  end
end
