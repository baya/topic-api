class User < ActiveRecord::Base

  has_secure_password

  def self.authorize!(params)
    name = params[:login]
    password = params[:password]
    User.find_by(name: name).try(:authenticate, password)
  end
  
end
