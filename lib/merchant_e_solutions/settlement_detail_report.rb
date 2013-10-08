require 'csv'

module MerchantESolutions
  class SettlementDetailReport
    REPORT_ID = 2
    REPORT_TYPE = 1

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
      CSV.parse(request, headers: true) do |csv|
        records << SettlementDetailRecord.new(csv)
      end
    end
  end
end
