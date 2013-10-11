require 'spec_helper'

describe MerchantESolutions::AdjustmentRecord do
  describe "#initialize" do
    subject { MerchantESolutions::AdjustmentRecord.new(csv_row) }

    #"Merchant Id","DBA Name","Control Number","Incoming Date","Card Number","Reference Number","Tran Date","Tran Amount","Auth Code","Adj Date","Adj Ref Num","Reason","First Time","Reason Code","CB Ref Num","Terminal ID"
    let(:csv_row) { [44, "Hamazon", 224, "08/11/2014", "654321xxxxxx1234", "'1176620", "07/27/2014", 15.0, 'aaa', "08/10/2013-", "1176538", "Fraud - Card Not Present Transaction", "Y", "UA02", 802061219, "b"] }

    its(:organization_id) { should == 44 }
    its(:organization_name) { should == "Hamazon" }
    its(:control_number) { should == 224 }
    it "parses out the incoming date" do
      subject.incoming_date.day.should == 11
      subject.incoming_date.month.should == 8
      subject.incoming_date.year.should == 2014
    end
    its(:card_number) { "654321xxxxxx1234" }
    its(:reference_id) { "1176620" }
    it "parses out the transaction date" do
      subject.transaction_date.day.should == 27
      subject.transaction_date.month.should == 7
      subject.transaction_date.year.should == 2014
    end
    its(:transaction_amount) { should == 15.0 }
    its(:authorization_code) { 'aaa' }
    it "parses out the adjustment date" do
      subject.adjustment_date.day.should == 10
      subject.adjustment_date.month.should == 8
      subject.adjustment_date.year.should == 2013
    end
    its(:adjustment_reference_number) { should == '1176538' }
    its(:reason) { should == "Fraud - Card Not Present Transaction" }
    its(:first_time) { should == true }
    its(:reason_code) { should == "UA02" }
    its(:cb_reference_number) { should == 802061219 }
    its(:terminal_id) { should == "b" }
  end
end
