require 'spec_helper'

describe MerchantESolutions::DepositReport do
  before { stub_net_http_requests }

  describe "#initialize" do
    let(:request) { double(:request, body: request_fixture('detail_report')) }
    before { MerchantESolutions::Request.stub(:new).and_return(request) }

    it "parses the body of the request as a CSV" do
      report = MerchantESolutions::DepositReport.new

      report.records.size.should be > 0

      report.records.each do |record|
        record.should be_a MerchantESolutions::DepositRecord
      end
    end
  end

  describe "#request_params" do
    let(:request_params) { MerchantESolutions::DepositReport.new(options).request_params }
    let(:options) { Hash.new }

    it "knows its dsReportId" do
      request_params[:dsReportId].should == 3
    end

    it "knows its reportType" do
      request_params[:reportType].should == 1
    end

    context "when options are passed in" do
      let(:options) { {test: 'params'} }

      it "merges in the options" do
        request_params[:test].should == 'params'
      end
    end
  end
end
