require 'spec_helper'

describe MerchantESolutions::Request do
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

  describe "#url" do
    subject { MerchantESolutions::Request.new(options).url }
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
