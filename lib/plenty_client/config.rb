module PlentyClient
  class Config
    class NoCredentials < StandardError; end
    class NoToken < StandardError; end
    class NoPlentyId < StandardError; end
    class InvalidCredentials < StandardError; end

    class << self
      attr_accessor :site_url, :api_user, :api_password, :access_token, :refresh_token, :log, :expiry_date, :plenty_id

      def validate_credentials
        raise NoCredentials if site_url.nil? || api_user.nil? || api_password.nil?
      end

      def tokens_present?
        !!(access_token && refresh_token)
      end

      def tokens_valid?
        tokens_present? && expiry_date.instance_of?(Time) && expiry_date > Time.now
      end
    end
  end
end
