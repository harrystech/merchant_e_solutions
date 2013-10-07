require 'spec_helper'

describe MerchantESolutions::Request do
  let(:report) { double(:report, type_id: 17)}

  describe "#url" do
    subject { MerchantESolutions::Request.new(report).url }
    it "generates a new url to the Merchant e-Solutions API" do
      request = MerchantESolutions::Request.new(report)

      request.url.should include "https://www.merchante-solutions.com/jsp/reports/report_api.jsp?"
    end

    it "gets the report id from the report" do
      request = MerchantESolutions::Request.new(report)

      request.url.should include "dsReportId=#{report.type_id}"
    end

    it { should include "dsReportId=#{report.type_id}" }
    it { should include "userId=#{MerchantESolutions::Configuration.user_id}" }
    it { should include "userPass=#{MerchantESolutions::Configuration.password}" }
  end
end
