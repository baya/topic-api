module Mobile
  module V1
    class ApiBase < Grape::API

      def self.inherited(subclass)
        super
        subclass.class_eval do
          version 'v1', using: :path
          format :json

          before do
            Rails.logger.debug "===> params is: #{params.inspect}\n===> headers is: #{headers.inspect}"
          end
        end
      end

    end
  end
end
