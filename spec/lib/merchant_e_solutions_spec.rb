require 'spec_helper'

describe MerchantESolutions do
  before { stub_net_http_requests }

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

  describe ".settlement_detail_report" do
    it "returns an Instance of MerchantESolution::SettlementReport" do
      MerchantESolutions.settlement_detail_report.should be_a MerchantESolutions::SettlementDetailReport
    end

    it "passes all options directly through to the new SettlementReport" do
      options = {hash: "with", any: "keys", and: "values"}

      MerchantESolutions::SettlementDetailReport.should_receive(:new).with(options)

      MerchantESolutions.settlement_detail_report(options)
    end
  end
end
