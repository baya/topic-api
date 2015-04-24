module Mobile
  module V1
    class User < ApiBase
      namespace :user do
        desc 'Get Current User Profile'
        get 'user_profile' do
          token = request.headers['Http-X-Authentication-Token']
          ApiError.raise_error(:Unauthorized) if token.blank?
          raw_data = Base64.decode64(token).split('::')
          @user = ::User.find_by_id(raw_data[0])
          ApiError.raise_error(:Unauthorized) if @user.nil?
          
          oauth_token = OauthToken.where(user_id: @user.id).order('created_at DESC').first
          ApiError.raise_error(:Unauthorized) if oauth_token.nil?

          service_token = oauth_token.generate_token(raw_data[0..1])

          ApiError.raise_error(:Unauthorized) if token != service_token

          generate_success_response({id: @user.id, name: @user.name}, 200)
        end
      end
      
    end
  end
end
