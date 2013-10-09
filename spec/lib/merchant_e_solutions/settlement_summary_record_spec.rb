require 'spec_helper'

describe MerchantESolutions::SettlementSummaryRecord do
  describe "#initialize" do
    subject { MerchantESolutions::SettlementSummaryRecord.new(csv_row) }
    # "Org Id","Org Name","Card Type","Sales Cnt","Sales Amt","Credits Cnt","Credits Amt","Net Amt"
    let(:csv_row) { ['42', "Hamazon", "Visa", 1337, 1000000000.0, 1, 0.01, 999999999.99] }

    its(:organization_id) { should == '42' }
    its(:organization_name) { should == "Hamazon" }
    its(:credit_company) { should == "Visa" }
    its(:sales_count) { should == 1337 }
    its(:sales_amount) { should == 1000000000.0 }
    its(:credits_count) { should == 1 }
    its(:credits_amount) { should == 0.01 }
    its(:net_amount) { should == 999999999.99 }
  end
end
