desc "API Routes"
task :api_routes => :environment do
  Mobile::Base.routes.each do |api|
    prefix = '/api/mobile'
    method = api.route_method.ljust(10)
    path = api.route_path
    puts "     #{method} #{prefix}#{path}"
  end
end
