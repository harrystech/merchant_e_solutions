module MerchantESolutions
  class SettlementReport
    TYPE_ID = 2

    def initialize(options = {})
      self.options = options
      request = Request.new(request_params)
    end

    def request_params
      {
        dsReportId: TYPE_ID
      }.merge(options)
    end


    private

    attr_accessor :options
  end
end
