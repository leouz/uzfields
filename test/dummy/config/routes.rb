Rails.application.routes.draw do
  get "one_image_field/index"

  get 'one_fields' => 'one_fields#index'
  get 'one_image_fields' => 'one_image_fields#index'
  get 'all_field_types' => 'all_field_types#index'

  namespace :json do
    resources :one_fields, :defaults => {format: :json} 
    resources :one_image_fields, :defaults => {format: :json} 
  end

  mount Uzfields::Engine => "/uzfields"
end
