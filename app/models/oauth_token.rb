class OauthToken < ActiveRecord::Base

  def self.generate_secret_key
    Base64.encode64(Random.new.bytes(16))
  end

  def self.generate_token(secret_key, data)
    str = Base64.encode64(OpenSSL::HMAC.hexdigest('sha256', secret_key, data))
    Base64.encode64("#{data}::#{str}").gsub("\n", '')
  end

end
