module MerchantESolutions
  class Report
    attr_reader :records, :request

    def initialize(params = {})
      self.options = params
      @request = Request.new(request_params)
      parse_records(request.body)
    end

    def request_params
      {
        dsReportId: report_id,
        reportType: report_type,
        includeTridentTranId: true,
        includePurchaseId: true,
        includeClientRefNum: true
      }.merge(report_specific_params)
    end

    def report_specific_params
      options
    end


    private

    attr_accessor :options

    def report_id
      raise "Implement in instances of sub-class"
    end

    def report_type
      raise "Implement in instances of sub-class"
    end

    def record_class
      raise "Implement in instances of sub-class"
    end

    def parse_records(request)
      @records = []
      CSV.parse(request, headers: true) do |csv|
        records << record_class.new(csv)
      end
    end
  end
end
