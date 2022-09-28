Rails.application.routes.draw do
  get 'admins/show'
  get 'clients/show'
  root "static_pages#home"
  devise_for :admins
  devise_for :clients
  devise_for :workers
  resources :job_requests, path:"jobs"
  resources :workers
  resources :clients
  resources :admins
end
