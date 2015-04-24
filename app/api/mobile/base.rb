module Mobile
  class Base < Grape::API
    format 'json'

    mount V1::Authentications::Token
    mount V1::User
    
  end
end
