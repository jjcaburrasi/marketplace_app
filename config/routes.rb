Rails.application.routes.draw do
  get 'admins/show'
  get 'clients/show'
  root "static_pages#home"
  devise_for :admins
  devise_for :clients
  devise_for :workers
  resources :job_requests, path:"jobs" do
    resources :candidacies, only: [:create, :destroy, :update, :edit]
  end
  resources :workers
  resources :clients
  resources :admins
  resources :candidacies, only: [:index]
  resources :placements
end

