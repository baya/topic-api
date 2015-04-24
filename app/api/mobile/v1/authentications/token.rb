module Mobile
  module V1
    module Authentications
      class Token < ApiBase
        namespace :authentications do

          helpers do
	  
	    def authenticate!
	      # error!('401 Unauthorized', 401) if !current_user
              ApiError.raise_error(:Unauthorized) if !current_user
	    end

	    def current_user
	      @current_user ||= User.authorize!(params)
	    end
	    
          end

          desc 'Retrieve Authentication Token'
          params do
            requires 'login', type: String
            requires 'password', type: String
          end
          post 'token' do
	    authenticate!
            token = OauthToken.create_with_user(current_user)
            # {resp_msg: 'success', token: token.token_string}
            generate_success_response({token: token.token_string}, 201)
          end
          
        end
      end
    end
  end
end
