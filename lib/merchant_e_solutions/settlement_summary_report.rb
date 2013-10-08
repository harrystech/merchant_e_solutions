require 'csv'

module MerchantESolutions
  class SettlementSummaryReport
    REPORT_ID = 2
    REPORT_TYPE = 0

    attr_reader :request, :records

    def initialize(options = {})
      self.options = options
      @request = Request.new(request_params).body
      parse_records(request)
    end

    def request_params
      {
        dsReportId: REPORT_ID,
        reportType: REPORT_TYPE
      }.merge(options)
    end


    private

    attr_accessor :options

    def parse_records(request)
      @records = []
      CSV.parse(request) do |csv|
        records << SettlementSummaryRecord.new(csv)
      end
    end
  end
end