module MerchantESolutions
  class Record


    private

    def parse_date(date)
      Date.strptime(date, "%m/%d/%Y") if date
    end

  end
end
