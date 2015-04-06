module Mobile
  module V1
    module Authentications
      class Token < ApiBase
        namespace :authentications do

          helpers do
            def authenticate_name_and_password
              name = params[:login]
              password = params[:password]
              @user = User.find_by(name: name).try(:authenticate, password) 
            end
          end

          before do
            raise 'authenticate error: invalid name or password' if !authenticate_name_and_password
          end

          desc 'Retrieve Authentication Token'
          params do
            requires 'login', type: String
            requires 'password', type: String
          end
          post 'token' do
            {resp_msg: 'success'}
          end
          
        end
      end
    end
  end
end
