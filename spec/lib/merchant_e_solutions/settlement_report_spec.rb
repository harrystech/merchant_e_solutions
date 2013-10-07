require 'spec_helper'

describe MerchantESolutions::SettlementReport do
  describe "#initialize" do
    it "gets a new report from the MerchantESolutions API" do
      MerchantESolutions::Request.should_receive(:new)

      MerchantESolutions::SettlementReport.new
    end
  end
end
