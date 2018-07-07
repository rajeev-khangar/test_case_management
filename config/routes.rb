Rails.application.routes.draw do
  
  root 'dashboard#index'

  resources :projects do
    resources :milestones
    resources :project_modules
  end

  resources :project_modules, only: [] do
    resources :module_test_cases
  end

  resources :milestones, only: [] do
    resources :milestone_cases, only: [:create, :index]
  end
end
