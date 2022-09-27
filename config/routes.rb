Rails.application.routes.draw do
  devise_for :admins
  devise_for :clients
  devise_for :workers
  root "application#hello"
end
