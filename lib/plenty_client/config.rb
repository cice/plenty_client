module PlentyClient
  class Config
    class NoCredentials < StandardError; end
    class NoToken < StandardError; end

    class << self
      attr_accessor :site_url, :api_user, :api_password, :access_token, :refresh_token, :log

      def validate
        raise NoCredentials if site_url.nil? || api_user.nil? || api_password.nil?
        raise NoToken if access_token.nil? || refresh_token.nil?
      end
    end
  end
end
