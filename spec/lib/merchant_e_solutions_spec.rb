require 'spec_helper'

describe MerchantESolutions do
  describe ".settlement_report" do
    it "returns an Instance of MerchantESolution::SettlementReport" do
      MerchantESolutions.settlement_report.should be_a MerchantESolutions::SettlementReport
    end

    it "passes all options directly through to the new SettlementReport" do
      options = {hash: "with", any: "keys", and: "values"}

      MerchantESolutions::SettlementReport.should_receive(:new).with(options)

      MerchantESolutions.settlement_report(options)
    end
  end
end
