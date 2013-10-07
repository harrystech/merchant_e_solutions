require 'spec_helper'

describe MerchantESolutions::Request do
  let(:report) { double(:report, type_id: 17)}

  describe ".get_report" do
    it "creates a new instance of request" do
      MerchantESolutions::Request.get_report(report)
    end
  end

  describe "#url" do
    subject { MerchantESolutions::Request.new.url }

    it { should include "https://www.merchante-solutions.com/jsp/reports/report_api.jsp?" }
    it { should include "userId=#{MerchantESolutions::Configuration.user_id}" }
    it { should include "userPass=#{MerchantESolutions::Configuration.password}" }
    it { should include "reportType=0" }
  end
end
