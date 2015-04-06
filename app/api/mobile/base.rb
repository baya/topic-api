module Mobile
  class Base < Grape::API
    format 'json'

    mount V1::Authentications::Token
    
  end
end
