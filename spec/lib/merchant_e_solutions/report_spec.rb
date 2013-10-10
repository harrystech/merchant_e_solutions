require 'spec_helper'

describe MerchantESolutions::Report do

  class TestRecord
    def initialize(row);end
  end

  class TestSubReport < MerchantESolutions::Report
    def report_id; 0; end
    def report_type; 9; end
    def record_class; TestRecord; end
  end

  before { stub_net_http_requests }

  describe "#initialize" do
    let(:request) { double(:request, body: request_fixture('settlement_detail')) }

    it "gets a new report from the MerchantESolutions API" do
      MerchantESolutions::Request.should_receive(:new).and_return(request)

      TestSubReport.new
    end

    it "parses out a date into usable request params for start and end dates" do
      begin_date = Date.parse('10/11/2012')
      end_date = Date.parse('11/12/2013')

      report = TestSubReport.new(begin_date: begin_date, end_date: end_date)

      report.request_params["beginDate.day"].should == begin_date.day
      report.request_params["beginDate.month"].should == (begin_date.month - 1)
      report.request_params["beginDate.year"].should == begin_date.year

      report.request_params["endDate.day"].should == end_date.day
      report.request_params["endDate.month"].should == (end_date.month - 1)
      report.request_params["endDate.year"].should == end_date.year
    end
  end

  describe "#request_params" do
    let(:report) { TestSubReport.new(testing: "tested", includeClientRefNum: false) }

    it "includes a dsReportID and reportType set in the subclass" do
      report.request_params[:dsReportId].should == report.report_id
      report.request_params[:reportType].should == report.report_type
    end

    it "pulls in the params from the report specific params" do
      report.request_params[:testing].should == "tested"
    end

    it "allows it's options to be overwritten" do
      report.request_params[:includeClientRefNum].should be_false
    end
  end
end
