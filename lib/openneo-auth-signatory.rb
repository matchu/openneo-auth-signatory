require 'rubygems'
require 'cgi'
require 'hmac-sha2'

class OpenneoAuthSignatory
  def initialize(secret)
    @hmac = HMAC::SHA256.new(secret)
  end
  
  def sign(data)
    @hmac << data.to_query
    @hmac.hexdigest
  end
end

# The following extension used to be present in ActiveSupport, but was removed
# in version 3. The code has been modified to be more generic and therefore
# concise.

class Hash
  def to_query
    collect do |key, value|
      "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
    end.sort * '&'
  end
end
