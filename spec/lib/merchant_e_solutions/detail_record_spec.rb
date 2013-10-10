require 'spec_helper'

describe MerchantESolutions::DetailRecord do
  describe "#initialize" do
    subject { MerchantESolutions::DetailRecord.new(csv_row) }

    # "Merchant Id","DBA Name","Term Num","Batch Num","Batch Date","Tran Date","Card Type","Card Number","Reference","Purchase Id","Auth Code","Entry Mode","Tran Amount","Trident Tran Id","Client Ref Num"
    let(:csv_row) { [42, "Hamazon", 1, 220, "10/07/2013", "10/06/2013", "AM", "000000xxxxxx1234", "'0000213", "AAAAAAAAAAA0", "100000", "KEYED", 7.09, "T.T.ID", "clientRefNumber"] }

    its(:organization_id) { should == 42 }
    its(:organization_name) { should == "Hamazon" }
    its(:term_number) { should == 1 }
    its(:batch_number) { should == 220 }
    it "parses out the transaction date" do
      subject.batch_date.day.should == 7
      subject.batch_date.month.should == 10
      subject.batch_date.year.should == 2013
    end
    it "parses out the transaction date" do
      subject.transaction_date.day.should == 6
      subject.transaction_date.month.should == 10
      subject.transaction_date.year.should == 2013
    end
    its("transaction_date.month") { should == 10 }
    its(:card_code) { should == "AM" }
    its(:card_number) { should == "000000xxxxxx1234" }
    its(:reference_number) { "'0000213"}
    its(:purchase_id) { "AAAAAAAAAAA0" }
    its(:auth_code) { "AAAAAAAAAAA0" }
    its(:entry_mode) { "AAAAAAAAAAA0" }
    its(:transaction_amount) { should == 7.09 }
    its(:trident_transaction_id) { should == "T.T.ID" }
    its(:client_reference_number) { should == "clientRefNumber" }
  end

  describe "credit cards" do
    subject { MerchantESolutions::DetailRecord.new([nil, nil, nil, nil, nil, nil, card_code]) }

    context "when the code is AM" do
      let(:card_code) { "AM" }
      its(:credit_company) { should == "American Express" }
    end
    context "when the code is DS" do
      let(:card_code) { "DS" }
      its(:credit_company) { should == "Discover" }
      its(:credit_type) { should == "Credit" }
    end
    context "when the code is MB" do
      let(:card_code) { "MB" }
      its(:credit_company) { should == "MasterCard" }
      its(:credit_type) { should == "Business" }
    end
    context "when the code is MC" do
      let(:card_code) { "MC" }
      its(:credit_company) { should == "MasterCard" }
      its(:credit_type) { should == "Credit" }
    end
    context "when the code is MD" do
      let(:card_code) { "MD" }
      its(:credit_company) { should == "MasterCard" }
      its(:credit_type) { should == "Debit" }
    end
    context "when the code is VB" do
      let(:card_code) { "VB" }
      its(:credit_company) { should == "Visa" }
      its(:credit_type) { should == "Business" }
    end
    context "when the code is VD" do
      let(:card_code) { "VD" }
      its(:credit_company) { should == "Visa" }
      its(:credit_type) { should == "Debit" }
    end
    context "when the code is VS" do
      let(:card_code) { "VS" }
      its(:credit_company) { should == "Visa" }
      its(:credit_type) { should == "Credit" }
    end
    context "when the code is unknown" do
      let(:card_code) { "something you've never seen" }
      its(:credit_company) { should == card_code }
      its(:credit_type) { should be_nil }
    end
  end
end
