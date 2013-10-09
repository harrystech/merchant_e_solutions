require 'spec_helper'

describe MerchantESolutions::Report do

  class TestRecord; end

  class TestSubReport < MerchantESolutions::Report
    def report_id; 0; end
    def report_type; 9; end
    def record_class; TestRecord; end
  end

  before { stub_net_http_requests }

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
