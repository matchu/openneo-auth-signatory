require 'rubygems'
require 'cgi'
require 'hmac-sha2'

module Openneo
  module Auth
    class Signatory
      def initialize(secret)
        @hmac = HMAC::SHA256.new(secret)
      end
      
      def sign(data)
        @hmac << data.to_openneo_auth_query
        @hmac.hexdigest
      end
    end
  end
end

# The following extension used to be present in ActiveSupport, but was removed
# in version 3. The code has been modified to be more generic and therefore
# concise.

class Hash
  def to_openneo_auth_query(namespace = nil)
    collect do |key, value|
      value.to_openneo_auth_query(namespace ? "#{namespace}[#{key}]" : key)
    end.sort * '&'
  end
end

class Object
  def to_openneo_auth_query(key)
    "#{CGI.escape(key.to_s)}=#{CGI.escape(to_s)}"
  end
end
