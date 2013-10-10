require 'spec_helper'

describe MerchantESolutions::SummaryRecord do
  describe "#initialize" do
    subject { MerchantESolutions::DepositRecord.new(csv_row) }
    # "Org Id","Org Name","Card Type","Sales Cnt","Sales Amt","Credits Cnt","Credits Amt","Net Amt"
    let(:csv_row) { ['42', "Hamazon", "10/24/2013", "CREDIT", 13.37, "'1777"] }

    its(:organization_id) { should == '42' }
    its(:organization_name) { should == "Hamazon" }
    it "parses out the date of the deposit" do
      subject.date.day.should == 24
      subject.date.month.should == 10
      subject.date.year.should == 2013
    end
    its(:type) { should == "CREDIT" }
    its(:amount) { should == 13.37 }
    its(:reference_id) { should == "'1777" }
  end
end
