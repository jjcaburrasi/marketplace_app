Rails.application.routes.draw do
  get  '/search_workers', to: 'workers#search_workers'
  get  '/search_jobs',    to: 'job_requests#search_jobs'
  
  root "static_pages#home"
  devise_for :admins
  devise_for :clients
  devise_for :workers
  resources :job_requests, path:"jobs" do
    resources :candidacies
    get '/suggestedworkers', to: 'workers#suggested_workers'
  end
  resources :workers do
    get  '/inform_worker',   to: 'workers#inform_worker' 
  end

  resources :clients do
    get 'myworkers', to: 'clients#myworkers'
  end
  resources :admins
  resources :candidacies, only: [:index]
  resources :placements

  namespace :api do
    namespace :v1 do
      resources :placements, only: [:index, :show, :create, :destroy]
    end
  end
end

