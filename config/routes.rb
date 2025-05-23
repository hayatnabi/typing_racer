Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "typing_racer", to: "typing_racer#index"
  post "typing_racer/race", to: "typing_racer#race"
  get "typing_racer/race", to: "typing_racer#race"
  # post "typing_racer/result", to: "typing_racer#result"
  post "typing_racer/finish", to: "typing_racer#finish"

  # Defines the root path route ("/")
  root "typing_racer#index"
end
