require 'spec_helper'

describe MerchantESolutions::SettlementReport do
  before { stub_net_http_requests }

  describe "#initialize" do
    it "gets a new report from the MerchantESolutions API" do
      MerchantESolutions::Request.should_receive(:new).and_return(double.as_null_object)

      MerchantESolutions::SettlementReport.new
    end

    describe "#request_params" do
      let(:request_params) { MerchantESolutions::SettlementReport.new(options).request_params }
      let(:options) { Hash.new }

      it "knows its dsReportId" do
        request_params[:dsReportId].should == 2
      end

      context "when options are passed in" do
        let(:options) { {test: 'params'} }

        it "merges in the options" do
          request_params[:test].should == 'params'
        end
      end
    end
  end
end
