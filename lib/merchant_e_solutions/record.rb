module MerchantESolutions
  class Record


    private

    def parse_date(date)
      if date && !date.empty?
        Date.strptime(date, "%m/%d/%Y")
      end
    end

    def parse_boolean(string)
      ['y', 'yes'].include? string.downcase
    end

  end
end
