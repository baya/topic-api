Rails.application.routes.draw do
  mount Mobile::Base => '/api/mobile'
end
