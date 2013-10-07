require 'uri'

module MerchantESolutions
  class Request
    BASE_URL = "https://www.merchante-solutions.com/jsp/reports/report_api.jsp"

    def self.get_report(report)
      new({})
    end

    def initialize(options = {})
      self.options = options
    end

    def url
      BASE_URL + '?' + param_string
    end


    private

    attr_accessor :options

    def param_string
      URI.encode_www_form(base_params.merge(options))
    end

    def base_params
      {
        userId: Configuration.user_id,
        userPass: Configuration.password,
        reportType: 0
      }
    end
  end
end
