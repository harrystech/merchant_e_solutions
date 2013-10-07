module MerchantESolutions
  class Configuration
    class << self
      attr_writer :user_id, :password

      def user_id
        @user_id ||= ENV['MERCHANT_E_SOLUTIONS_USER_ID']
      end

      def password
        @password ||= ENV['MERCHANT_E_SOLUTIONS_PASSWORD']
      end
    end
  end
end
