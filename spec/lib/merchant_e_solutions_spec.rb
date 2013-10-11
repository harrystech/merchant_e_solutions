require 'spec_helper'

describe MerchantESolutions do
  before { stub_net_http_requests }

  describe ".batch_summary_report" do
    it "returns an Instance of MerchantESolution::BatchReport" do
      MerchantESolutions.batch_summary_report.should be_a MerchantESolutions::BatchSummaryReport
    end

    it "passes all options directly through to the new BatchReport" do
      options = {hash: "with", any: "keys", and: "values"}

      MerchantESolutions::BatchSummaryReport.should_receive(:new).with(options)

      MerchantESolutions.batch_summary_report(options)
    end
  end

  describe ".batch_detail_report" do
    it "returns an Instance of MerchantESolution::BatchReport" do
      MerchantESolutions.batch_detail_report.should be_a MerchantESolutions::BatchDetailReport
    end

    it "passes all options directly through to the new BatchReport" do
      options = {hash: "with", any: "keys", and: "values"}

      MerchantESolutions::BatchDetailReport.should_receive(:new).with(options)

      MerchantESolutions.batch_detail_report(options)
    end
  end

  describe ".settlement_summary_report" do
    it "returns an Instance of MerchantESolution::SettlementReport" do
      MerchantESolutions.settlement_summary_report.should be_a MerchantESolutions::SettlementSummaryReport
    end

    it "passes all options directly through to the new SettlementReport" do
      options = {hash: "with", any: "keys", and: "values"}

      MerchantESolutions::SettlementSummaryReport.should_receive(:new).with(options)

      MerchantESolutions.settlement_summary_report(options)
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

  describe ".deposit_report" do
    it "returns an Instance of MerchantESolution::SettlementReport" do
      MerchantESolutions.deposit_report.should be_a MerchantESolutions::DepositReport
    end

    it "passes all options directly through to the new SettlementReport" do
      options = {hash: "with", any: "keys", and: "values"}

      MerchantESolutions::DepositReport.should_receive(:new).with(options)

      MerchantESolutions.deposit_report(options)
    end
  end

  describe ".adjustment_report" do
    it "returns an Instance of MerchantESolution::SettlementReport" do
      MerchantESolutions.adjustment_report.should be_a MerchantESolutions::AdjustmentReport
    end

    it "passes all options directly through to the new SettlementReport" do
      options = {hash: "with", any: "keys", and: "values"}

      MerchantESolutions::AdjustmentReport.should_receive(:new).with(options)

      MerchantESolutions.adjustment_report(options)
    end
  end
end
