Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :admins
  devise_for :clients
  devise_for :workers
  resources :job_requests
  resources :workers, only: :show
end
