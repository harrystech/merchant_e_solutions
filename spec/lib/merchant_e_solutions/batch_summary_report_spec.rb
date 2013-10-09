require 'spec_helper'

describe MerchantESolutions::BatchSummaryReport do
  before { stub_net_http_requests }

  describe "#initialize" do
    let(:request) { double(:request, body: request_fixture('settlement_summary')) }

    before { MerchantESolutions::Request.stub(:new).and_return(request) }

    it "gets a new report from the MerchantESolutions API" do
      MerchantESolutions::Request.should_receive(:new).and_return(request)

      MerchantESolutions::BatchSummaryReport.new
    end

    it "parses the body of the request as a CSV" do
      report = MerchantESolutions::BatchSummaryReport.new

      report.records.size.should be > 0

      report.records.each do |record|
        record.should be_a MerchantESolutions::SummaryRecord
      end
    end
  end

  describe "#request_params" do
    let(:request_params) { MerchantESolutions::BatchSummaryReport.new(options).request_params }
    let(:options) { Hash.new }

    it "knows its dsReportId" do
      request_params[:dsReportId].should == 1
    end

    it "knows its reportType" do
      request_params[:reportType].should == 0
    end

    context "when options are passed in" do
      let(:options) { {test: 'params'} }

      it "merges in the options" do
        request_params[:test].should == 'params'
      end
    end
  end
end
