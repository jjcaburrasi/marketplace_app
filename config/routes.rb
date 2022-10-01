Rails.application.routes.draw do
  get 'admins/show'
  get 'clients/show'
  get  '/search_workers', to: 'workers#search_workers'
  get  '/search_jobs',    to: 'job_requests#search_jobs'
  root "static_pages#home"
  devise_for :admins
  devise_for :clients
  devise_for :workers
  resources :job_requests, path:"jobs" do
    resources :candidacies, only: [:create, :destroy, :update, :edit]
    get '/suggestedworkers', to: 'workers#suggested_workers'
  end
  resources :workers
  resources :clients
  resources :admins
  resources :candidacies, only: [:index]
  resources :placements
end

