require 'spec_helper'

describe MerchantESolutions::Request do
  describe "#initialize" do
    let(:http_request) { double(:request, body: "Nice Body") }
    let(:http) { double(:http, "use_ssl=" => true, request: double.as_null_object) }

    before { Net::HTTP.stub(:new).and_return(http) }

    it "calls out to the Merchant e-Solutions API" do
      http.should_receive(:request).and_return(http_request)

      MerchantESolutions::Request.new.body.should == http_request.body
    end

    it "securely calls out to the MeS API" do
      http.should_receive(:use_ssl=).with(true)

      MerchantESolutions::Request.new
    end
  end

  describe ".get_report" do
    let(:report) { double(:report, request_params: {id: 17})}

    it "creates a new instance of request" do
      MerchantESolutions::Request.get_report(report)
    end

    it "the request params into the new request" do
      MerchantESolutions::Request.should_receive(:new).with(report.request_params)

      MerchantESolutions::Request.get_report(report)
    end
  end

  describe "#uri" do
    subject { MerchantESolutions::Request.new(options).uri.to_s }
    let(:options) { {} }

    it { should include "https://www.merchante-solutions.com/jsp/reports/report_api.jsp?" }
    it { should include "userId=#{MerchantESolutions::Configuration.user_id}" }
    it { should include "userPass=#{MerchantESolutions::Configuration.password}" }
    it { should include "reportType=0" }

    context "when options are passed into" do
      let(:options) { {dsReportId: 17} }
      it { should include "dsReportId=17" }
    end
  end
end
