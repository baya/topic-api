class OauthToken < ActiveRecord::Base

  attr_accessor :token_string
  
  def self.create_with_user(user)
    data = [user.id, (Time.now.to_f * 1000).to_i]
    secret_key = generate_secret_key
    token_string = generate_token(secret_key, data)
    token = create(secret_key: secret_key, user_id: user.id)
    token.token_string = token_string
    
    token
  end

  def self.generate_secret_key
    Base64.encode64(Random.new.bytes(16))
  end

  def self.generate_token(secret_key, data)
    data = data.join('::')
    str = Base64.encode64(OpenSSL::HMAC.hexdigest('sha256', secret_key, data))
    Base64.encode64("#{data}::#{str}").gsub("\n", '')
  end

  def generate_token(data)
    self.class.generate_token(self.secret_key, data)
  end

end
