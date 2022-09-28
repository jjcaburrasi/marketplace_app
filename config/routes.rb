Rails.application.routes.draw do
  get 'clients/show'
  root "static_pages#home"
  devise_for :admins
  devise_for :clients
  devise_for :workers
  resources :job_requests, path:"jobs"
  resources :workers, only: :show
  resources :clients, only: :show
end
