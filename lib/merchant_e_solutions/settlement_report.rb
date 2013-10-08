require 'csv'

module MerchantESolutions
  class SettlementReport
    TYPE_ID = 2

    attr_reader :request, :records

    def initialize(options = {})
      self.options = options
      @request = Request.new(request_params).body
      parse_records(request)
    end

    def request_params
      {
        dsReportId: TYPE_ID
      }.merge(options)
    end

    private

    attr_accessor :options

    def parse_records(request)
      @records = []
      CSV.parse(request) do |csv|
        records << SettlementRecord.new(csv)
      end
    end
  end
end
