require 'net/http'
require 'uri'

module MerchantESolutions
  class Request
    BASE_URL = "https://www.merchante-solutions.com/jsp/reports/report_api.jsp"

    attr_reader :body

    def initialize(options = {})
      @options = options
      make_request
    end

    def uri
      URI.parse(BASE_URL + '?' + param_string)
    end


    private

    attr_reader :options

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

    def http
      @http ||= Net::HTTP.new(uri.host, uri.port).tap do |http|
        http.use_ssl = true
      end
    end

    def make_request
      @body = http.request(Net::HTTP::Get.new(uri.request_uri)).body
    end
  end
end
