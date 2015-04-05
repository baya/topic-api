module Mobile
  module V1
    class ApiBase < Grape::API
      version 'v1', using: :path
      format :json

    end
  end
end
