require 'uri'

module MerchantESolutions
  class Request
    BASE_URL = "https://www.merchante-solutions.com/jsp/reports/report_api.jsp?"

    attr_accessor :report

    def initialize(report)
      self.report = report
    end

    def url
      BASE_URL + params
    end


    private

    def params
      URI.encode_www_form(base_params)
    end

    def base_params
      {
        dsReportId: report.type_id,
        userId: Configuration.user_id,
        userPass: Configuration.password
      }
    end
  end
end
